---
layout: post
title: "One Cup for Two Kinds of Sleep"
date: 2026-10-20
description: "CoffeeX keeps a Mac awake with one menu-bar cup. One Advanced checkbox decides whether that same session also survives a closed lid."
---

I wanted one cup in the menu bar. Click it and the Mac stops idle sleep. With one checkbox on, that same click also keeps the Mac awake after the lid closes. The checkbox is the preference, the cup is the switch, and turning the cup off does not clear the checkbox.

The app on this machine is CoffeeX, at `/Applications/CoffeeX.app`. The bundle id is still `info.marcel-dierkes.KeepingYouAwake`, the version string is still `1.6.9`, and it requires macOS 12. I got there by putting a lid-sleep tool inside an idle-sleep tool, then deleting the second set of timers.

## Two ways the machine goes to sleep

Idle sleep is the timer. Leave the Mac alone and it sleeps. Apple ships `caffeinate` for this, and a menu-bar wrapper around it covers a presentation, a download, or a lid that stays open.

Lid-close sleep is a different path. Shut the lid and macOS sleeps the machine even while `caffeinate` is running. The override is `pmset disablesleep`. `pmset -g` prints it as `SleepDisabled`. `1` means the Mac stays awake with the lid closed. `0` means a closed lid can sleep it. The setting is runtime-only. A reboot clears it.

A Mac on AC power with an external display also stays awake when the lid closes. That is clamshell mode, and `SleepDisabled` can stay `0` the whole time. To see the checkbox by itself, unplug the display.

## Two clocks for one cup

[KeepingYouAwake](https://github.com/newmarcel/KeepingYouAwake), by Marcel Dierkes, is the idle-sleep half. It is a small AppKit menu-bar utility around `/usr/bin/caffeinate`. Left click toggles a session. A session can be indefinite or a duration. The indefinite value in code is `KYASleepWakeTimeIntervalIndefinite`, `0` seconds, and that `0` means no end time.

A duration already ended the session, and so did the battery threshold, 50 percent and enabled on this machine. Low Power Mode, losing the external display, and a user switch could end it too. A closed lid is out of scope in its own docs.

[Sleepless](https://github.com/Aboudjem/Sleepless), by Adam Boudjemaa, MIT, is the lid half. It runs `sudo -n /usr/bin/pmset -a disablesleep 1` and the same command with `0`, then reads `SleepDisabled` from `pmset -g` and the battery from `pmset -g batt`. Beside the cup it had its own switch, an auto-off of off, 1 hour, or 2 hours, and a battery floor from 5 to 50 percent, default 15. On battery, Low Power Mode turned it off unless I had just forced it on.

I put that panel in a Sleepless tab. `KYAClamshellSleepController` ran the `pmset` calls, a 60-second poll, its own auto-off, and the floor stored as `KYAClamshellBatteryFloorPercent`. On this machine the slider sat at 50. `sudo` cannot run inside the App Sandbox, so I removed that entitlement. First launch runs `grant-clamshell-sleep.sh` through `osascript` with administrator privileges, and the script writes `/etc/sudoers.d/keepingyouawake-disablesleep` once `visudo -cf` accepts it:

```
$USER ALL=(root) NOPASSWD: /usr/bin/pmset -a disablesleep 0, /usr/bin/pmset -a disablesleep 1
```

Later toggles do not ask for a password. The tab worked, and it was the wrong shape. KeepingYouAwake already had a duration and a battery cutoff. The tab had added a second of each.

Then the checkbox cleared itself. The machine was on battery, around 80 percent, discharging, Low Power Mode on (`powermode 1` in `pmset -g custom`). The poll treated Low Power Mode as a reason to force `disablesleep 0`, and it ran in the same moment I turned the feature on. A `userForcedOn` flag made the turn-on stick; the battery floor still cleared the session. I deleted the poll, the flag, the slider, and the tab the same day. Duration and Battery are the safety nets. The grant script stayed, and `THIRD_PARTY_NOTICES` carries the Sleepless MIT notice, copyright 2026 Adam Boudjemaa.

## The cup does not write the preference

The lid row now lives on the Advanced tab: "Keep awake with the lid closed", key `KYAClamshellWakeEnabled`. Unchecking it removes the key, which is how the other Advanced rows work, and a missing key reads as off.

A click still only schedules or terminates `KYASleepWakeTimer`. Lid-closed wake is a side effect of a scheduled timer, and only while that row is on. Cup on, row on: `caffeinate` starts and `pmset` sets `disablesleep 1`. Cup off: `caffeinate` stops, and if this process had turned lid wake on, `pmset` sets `disablesleep 0`. Duration, the battery threshold, Low Power Mode, a display unplug, a user switch, and quit take the same path, because they end the session. Flipping the row during a running session applies immediately: on makes `SleepDisabled` `1`, off makes it `0`, and `caffeinate` keeps running either way.

`caffeinate` starts as `/usr/bin/caffeinate -di -w <app pid>`, plus `-t <seconds>` when the session has an end. `-w` binds it to the app, so a crash drops the idle-sleep assertion and leaves `disablesleep` alone. On the next launch, if the preference is on, no timer is scheduled, and `SleepDisabled` is still `1`, the app clears it. Quit does the same when this process was the one that set it. `clamshellWakeActive` only remembers a successful `pmset` from this process. When the preference and the timer disagree with that flag, the app calls `pmset` again.

## What I saw on 20 October

Turning the row on during a running session set `SleepDisabled` to `1`. Quit left the row on and put `SleepDisabled` back to `0`. Relaunch with Activate on Launch started an indefinite session (the log said `will activate with time interval 0`) and set `SleepDisabled` to `1`. Cup clicks left the row checked, and `SleepDisabled` followed the cup. Row off, cup on: `caffeinate -di`, `SleepDisabled` `0`.

The log line is `Lid-closed wake: setting= timer= active=`. `setting=1 timer=0 active=1` is the cup going off, about to clear `disablesleep`. `setting=0 timer=1 active=0` is cup on, row off, lid wake left alone.

Closing the lid in that second state still left the Mac awake. AC power, charge finishing near 99 percent, a 3840×1600 external display, the built-in Liquid Retina XDR. Clamshell mode keeps the machine up with `SleepDisabled` at `0`. QuickTime Player, Chrome playing audio, coreaudiod, Cursor, and powerd were holding idle-sleep assertions too. Those block idle sleep with the lid open. They are not `SleepDisabled`. With the display unplugged, cup on and the row on stays awake, and cup on with the row off should sleep. The row does nothing while the cup is off.

A different "stuck off" was the preferences file. CoffeeX is unsandboxed and reads `~/Library/Preferences/info.marcel-dierkes.KeepingYouAwake.plist`. The stock app in `/Applications` is sandboxed, so the same domain also exists under `~/Library/Containers/info.marcel-dierkes.KeepingYouAwake/Data/Library/Preferences/`. I had written `KYAClamshellWakeEnabled` into the container. The unsandboxed app logged `setting=0` with the cup on and never touched `disablesleep`. The same key in the home plist logged `setting=1` and set `SleepDisabled` to `1`.

An earlier key, `info.marcel-dierkes.KeepingYouAwake.ClamshellWakeEnabled`, never reached its KVO observer. `NSUserDefaults` treats dots as a path through objects. The Advanced row binds `KYAClamshellWakeEnabled`: yes writes the bool, no removes it, and the controller calls `updateClamshellWake` on the main queue. I kept the bundle id so the durations and the 50 percent threshold stayed. Sparkle still points at Marcel Dierkes's appcast, and this rename should not be treated as his update.

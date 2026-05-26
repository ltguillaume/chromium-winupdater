# Brave Customization
This repository contains two registry files to customize a Brave Browser installation. You can apply them at any time (i.e. before installation, or to enforce the settings at later moment).

## Contents
1. `brave-disable-services.reg` disables some Brave services:
   - AI Chat (Leo)
   - News
   - Talk
   - VPN
   - Wallet (crypto)
2. `brave-policies.reg` sets a few policies to disable telemetry and to enforce sane defaults
3. `brave-rebuild-icon-cache.cmd` may be tried to fix the jumplist menu for a pinned Brave icon in the taskbar: e.g. sometimes the option to open a private window via a right-click is not available

## After installation
A few settings cannot be changed via policies (to my knowlegde), so you can set them manually after installation:

#### During onboarding
- [ ] Automatically send diagnostic reports > Disabled

#### Settings > Shields
- [ ] Save contact data for error reports > Disabled
- [x] Allow element blocking in private windows > Enabled
- [ ] Allow Facebook logins and embedded messages > Disabled

# op25-scripts
Various scripts for monitoring Chicagoland P25 radio frequencies (incl. STARCOM21) with [OP25](http://op25.osmocom.org/trac/wiki) and a [RTL-SDR](http://www.rtl-sdr.com/about-rtl-sdr/) dongle

This is experimental software - use at your own risk.

Important files:

- `.env.example` - various environment vars used by the shell scripts; **copy to .env upon cloning this repo**
- `op25_conventional_rx.sh` - receive a conventional P25 Phase I frequency (run without arguments for usage)
- `op25_trunked_rx.sh` - receive a P25 Phase I(I) trunking system (run without arguments for usage)
- `start_audio.sh` - helper script to launch OP25 audio player
- `trunk.tsv` - a list of trunked systems that can be monitored

STARCOM21-specific files:

- `sc21_tgs.tsv` - a list of TGIDs for STARCOM21 and corresponding descriptions
- `sc21_bcd396xt.wlist` - a list of TGIDs that are being scanned by CrimeIsDown.com's live feed
- `sc21_encrypted.blist` - a list of encrypted TGIDs that should not be monitored (otherwise you get garbled sounds)
- `starcom21_talkgroups.ods` - use this to generate `sc21_tgs.tsv` (see the "output" sheet); data pulled from [RadioReference](https://www.radioreference.com/apps/db/?sid=2324) (last updated: 7/30/2017)

Updated: 2018.5.14
Metadata in emulationstation will be saved when rebooting and shutting down.

rrifonas [3/30/2019]: Make it compatible with the Tinker Board
rrifonas [8/18/2019]: Added multi-sw script for Tinker Board

# retroflag-picase
RetroFlag Pi-Case Safe Shutdown

Turn switch "SAFE SHUTDOWN" to ON.

--------------------

Example for RetroPie:

-------------------Multi Switch Shutdown-----------------
Updated: 2019.2.14

Multi Switch Shutdown with advanced shutdown features for more natural behaviour:

If you press restart if emulator is currently running, then you will be kicked back to ES main menu.

If you press restart in ES main screen, ES will be restartet (no reboot!), good for quick saving metadata or internal saves.

If you press power-off then Raspberry will shutdown

All metadata is always saved

Multi Switch Shutdown by crcerror at here https://github.com/crcerror/retroflag-picase

-------------------Multi Switch Shutdown-----------------

1. Make sure internet connected.
2. Make sure keyboard connected.
3. Press F4 enter terminal.
4. In the terminal, type the one-line command below(Case sensitive):

Normal:
wget -O - "https://raw.githubusercontent.com/rrifonas/retroflag-picase/master/install.sh" | sudo bash
Multi-Switch:
wget -O - "https://raw.githubusercontent.com/rrifonas/retroflag-picase/master/install-multi.sh" | sudo bash

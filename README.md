# SETS_Docker
Docker based installation of SETS from STOCD

This will prep a live and a test version of SETS to run in a Docker/linux environment.  The software will provide you a window through an xserver running on the Windows machine.

## Requirements
* Docker <https://www.docker.com/get-started/>
* WSL2 (for Docker) <https://docs.microsoft.com/en-us/windows/wsl/install>
* VcXsrv <https://sourceforge.net/projects/vcxsrv/>
* PowerShell (built-in on Win10 or later) to use build script -- can be done manually in Command Prompt

## Using
- Install Docker+WSL2
- Install VcXsrv
    - Run
    - Any window display options are acceptable, Multiple Windows suggested
    - Display 0:0

- Create and enter a directory to install `SETS` and `SETS_Docker` into)
    > git clone https://github.com/STOCD/SETS.git STOCD_SETS
    > git clone https://github.com/SETS_Docker.git
    
- Download https://stobuilds.com/SETS/downloads/images.zip
    - Uncompress and place into `STOCD_SETS` as `STOCD_SETS/images`
- Create or copy your `.config/` folder into the same folder
    - Create or copy your `.debug` file into the `.config/` folder
- There should now be at least the following in the folder you are in:
    - `.config/`
        - `.config/.debug`
    - `SETS_Docker/`
    - `STOCD_SETS/`
        - `STOCD_SETS/images/`
- > Set-ExecutionPolicy RemoteSigned

    - This will allow you to run the ps1 as a script.
    - You can just copy the text and paste it instead of using this
- > ./SETS_Docker.ps1/SETS_build.ps1

    - This will create the image
        
## Running
You'll have a new image (`sets_docker`) to run in the Docker interface.
- The existing script will prepare a *copy* of SETS in /root/SETS, no updates/saves/caches will update outside of the Docker
- If you add the folder when you run the image (`[...]/STOCD_SETS` -> `/root/LIVE_SETS`), it will have a live version that reads and saves to the source folder outside of Docker.
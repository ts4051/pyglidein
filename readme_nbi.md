# NBI pyglidein

This file contains details of the installation and usage of pyglidein clients for the NBI IceCube GPUs. Contact Tom Stuttard (stuttard@icecube.wisc.edu) with questions.

All pyglidein stuff is installed on `icecube01` as the `icecube` user. Everything is contained in the `/groups/icecube/icecube/cluster`.

## Installation

We're using a fork of `pyglidein` in Tom's GitHub (https://github.com/ts4051/pyglidein, `master` branch), cloned into `/groups/icecube/icecube/cluster/pyglidein`

Python 2.7 or above is required, so the system python (2.6) is not compatible. Anaconda is installed in `/groups/icecube/icecube/cluster/anaconda` to get a more up-to-date python, and we're using a conda env (called `pyglidein`) to keep an isolated environment.

There is a config file steering glideins at our site (`pyglidein/configs/nbi.config`).

An empty file called `pyglidein/configs/nbi.secret` must also be created, which must have its permissions set to `600`.

## Running the client

A script for running the client can be found here (includes setting up environment):

`pyglidein/start_client_nbi.sh`

You can direct run this for testing, but in general we run this using a `crob` job so that it is launched periodically to ensure we always have glideins running. The following is added to the `crontab` to start the client every 10 minutes (you can edit the crobtab using the command `crontab -e`):

```
MAILTO=thomas.stuttard@nbi.ku.dk
#*/10 * * * * sh /groups/icecube/icecube/cluster/pyglidein/start_client_nbi.sh > /groups/icecube/icecube/cluster/log/cron.log 2>&1
```

Output from the cron jobs can be found in `/groups/icecube/icecube/cluster/log/`.

## Checking system

Check that glideins are running at NBI using the follwoj gcommand (from `icecube01`, `hep01`, etc):

`squeue --user=icecube`

Check which sites are visible to the main server (check if `NBI` appears):

```
ssh sub-1
condor_status -af GLIDEIN_Site|sort|uniq -c|sort -n
```

View the status of the all GPU usage in the system:

https://grafana.icecube.wisc.edu/grafana/dashboard/db/gmerino-gpu-goodput-badput-committedtime

## Trouble-shooting

If glideins are refusing to start, try:

- Check CVMFS is mounted


#!/bin/bash

squeue -t pending --sort=-p \
 --format="%.16i %.9p %.8u %.16a %.18P %.10l %.4C %.7m"

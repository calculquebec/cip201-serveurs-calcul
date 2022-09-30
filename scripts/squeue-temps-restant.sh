#!/bin/bash

squeue -t running --sort=+M --format="%.14i %.18P %.10M %.4C %.7m %R"

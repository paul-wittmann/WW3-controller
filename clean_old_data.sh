#!/bin/sh

find /ocean/aws/hs_files/* -type f -name "hs*.dat" -mtime +1 | xargs -i rm {}
find /ocean/aws/Jfiles/* -type f -name "J2*" -mtime +7 | xargs -i rm {}
find /ocean/aws/Jfiles/* -type d -empty | xargs -i rmdir {}
find /ocean/earth/winds/gfs0p25/* -type f -name "uwd*" -mtime +7 | xargs -i rm {}
find /ocean/earth/winds/gfs0p25/* -type f -name "vwd*" -mtime +7 | xargs -i rm {}
find /ocean/earth/winds/gfs0p25/* -type f -name "prs*" -mtime +7 | xargs -i rm {}
find /ocean/earth/winds/gfs0p25/* -type d -empty | xargs -i rmdir {}


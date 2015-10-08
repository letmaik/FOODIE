#!/bin/bash
# script automotion for FOODiE's errors analysis of the provided tests
cd ../../../
echo "Building tests executables"
FoBiS.py build -mode errors-analysis --build_dir papers/announcement/errors_analysis/tests > buils.log
cd -
echo "Oscillation test errors analysis"
rm -rf results-oscillation
mkdir results-oscillation
cd results-oscillation
../tests/oscillation --errors_analysis --output errors_analysis-oscillation > summary.log
tecplot=$(which tec360)
if [ -x "$tecplot" ] ; then
  ln -fs ../utilities-oscillation/*lay .
  ln -fs ../utilities/lay_export* .
  for file in $( ls *lay ); do
  ./lay_export_all_f $file
  done
fi
cd -
exit 0

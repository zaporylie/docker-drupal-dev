#!/bin/bash

testCodeShiffer()
{
  if [ -z "${TEST_CS}" ]; then
    startSkipping
  else
  	RESULTS=$(phpcs --standard=$HOME/.composer/vendor/drupal/coder/coder_sniffer/Drupal --extensions="php,module,inc,install,test,profile,theme,js,css,info,txt" ${TEST_CS_PATH})
  	assertEquals "CodeSniffer test failed" 0 $(${RESULTS} | wc -l)
  fi
}

. shunit2
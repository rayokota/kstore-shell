#!/bin/bash
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.set -x -e

# kstore-shell.sh
#
# This will start hbase shell using the pom.xml.

print_synopsis() {
	echo "USAGE: $0 <bootstrap-servers>"
}

if [[ $# -lt 1 ]]; then
	print_synopsis
	exit 1
fi

# Allow executing from any directory
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Test for java
hash java 2>/dev/null  || { echo >&2 'Java needs to be installed'; exit 1; }

# Test for Maven
hash mvn 2>/dev/null  || { echo >&2 'Apache Maven needs to be installed.'; exit 1; }

mvn clean package exec:java -Dbootstrap.servers="$1"


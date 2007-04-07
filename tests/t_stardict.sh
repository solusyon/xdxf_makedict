#!/bin/sh

source funcs.sh
set_md_plugin_dir

FILE=/tmp/dummy_parser_input
NWORDS=10

generate_file $NWORDS $FILE

cat $FILE | ../src/makedict -i dummy -o stardict --work-dir /tmp $FILE

RES=/tmp/stardict-dummy_parser_input-2.4.2

if ! ./validate_stardict `ls "${RES}"/*.ifo`; then
	echo "test failed, see $FILE and $RES" >&2
	exit 1
fi

rm -fr "${RES}"
rm -f $FILE

exit $res
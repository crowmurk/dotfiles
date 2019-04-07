SCRIPTDIR=`dirname $0`
FORCE="$1"
SYNTAX="$2"
EXTENSION="$3"
OUTPUTDIR="$4"
INPUT="$5"
CSSFILE="$6"
TEMPLATE="$7"
DEFAULTTEMPLATE="$8"
EXTENSIONTEMPLATE="$9"
ROOTPATH="${10}"
CUSTOM="${@:11}"

[ $SYNTAX = "markdown" ] || { echo "Error: Unsupported syntax"; exit -2; };
SYNTAX=markdown+lists_without_preceding_blankline-blank_before_blockquote+hard_line_breaks

[ -f $CSSFILE ] || cp $SCRIPTDIR/style.css $CSSFILE;

OUTPUT="$OUTPUTDIR"/$(basename "$INPUT" .$EXTENSION).html

pandoc $INPUT -f $SYNTAX --css=$CSSFILE -s -t html -o $OUTPUT > /dev/null 2>&1

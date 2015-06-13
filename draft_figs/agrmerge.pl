#!/usr/bin/perl
#
# Merge several Grace graphs by shifting the graph numbers
#
# usage: agrmerge file1.agr file2.agr ...
# 
# output to stdout
#

sub shiftgraph
{
    $mgraph = -1;
    $cfile = 100;
    open $cfile, "<$_[0]";

    while( <$cfile> ) {
        if( /([gG])([0-9]+)/ && $2>$mgraph ) { 
            $mgraph= $2;
        }
        s/([gG])([0-9]+)/join("",$1,$2+$_[1] )/e; 
        print $_;
    }
    close $cfile;
    return $mgraph;
}
    
$grshift = 0;
foreach  $fname ( @ARGV ) {
    $grshift += 1 + shiftgraph($fname, $grshift);
}


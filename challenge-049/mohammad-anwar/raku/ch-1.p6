#!/usr/bin/env perl6

use v6;

sub MAIN($num!) {
    my (Int $res, Int $i);
    repeat { $res = $num * ++$i; } until $res ~~ /^<[01]>+$/;
    $res.say;
}

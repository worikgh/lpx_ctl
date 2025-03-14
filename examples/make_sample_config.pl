#!/usr/bin/perl -w
use strict;

my $file_name = shift or die;
-e $file_name and die "$file_name exists.  Not overwriting it.  Bye!";
my $note = 1; ## 1..64
my @drumkits = map {chomp; $_} `find drumkits/ -type f -name '*.wav' -or -name '*.flac'`;

## There are 64 pads, so take 64 of these at random
my @drums = ();
while(scalar(@drums) < 64){
    # print join(", ", @drumkits)."\n";
    my $idx = rand() * scalar(@drumkits);
    push(@drums, "{\"path\":\"$drumkits[$idx]\",\"note\":$note}");
    $note++;
    my @new_drumkits = splice(@drumkits, 0, $idx);
    shift(@drumkits);
    push(@new_drumkits, @drumkits);
    @drumkits = @new_drumkits;
}
#{'path':'drumkits/GMRockKit/Tom1-Hardest.wav','note':62}
my $dm = join(",\n", @drums);
my $dru = "[$dm]\n";
print "{
  \"samples_descr\": 
      		   $dru
      
  }
";

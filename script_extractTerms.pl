#!/usr/bin/perl

my $text = `cat id-cat-tag.txt`;

my @lines = split (/\n/, $text);

foreach my $line (@lines) {
  my @details = split (/,/, $line);

  my $id = @details[0];
  my @cats = split (/\|/, @details[1]);
  my @tags = split (/\|/, @details[2]);

  foreach my $cat (@cats) {
	print "$id\tcategory\t$cat\n";
  }
  foreach my $tag(@tags) {
	print "$id\tpost_tag\t$tag\n";
  }
}

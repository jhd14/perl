#!/usr/bin/perl

my $text = `cat export.tsv`;

my @lines = split (/\n/, $text);

shift @lines;

my %posts = ();

foreach my $line (@lines) {
  my @details = split (/\t/, $line);

  my $id = @details[0];
  my $taxonomy = @details[4];
  my $term = @details[5];

	if (! $posts{$id}) {
		$posts{$id} = ();
#		$posts{$id}{'category'} = ();
#		$posts{$id}{'post_tag'} = ();
	}

	if ($taxonomy) {
		$posts{$id}{$taxonomy}{$term} = 1;
	}
}


foreach my $id ( sort keys %posts ) {
	my @categories = sort keys %{ $posts{$id}{'category'} };
	my @tags = sort keys %{ $posts{$id}{'post_tag'} };

	$category = join("|", @categories);
	$tag = join("|", @tags);
	print "$id\t$category\t$tag\n";
}

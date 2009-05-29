use strict;
use warnings;
use Test::More tests => 19;
use Crypt::PerfectPaperPasswords;

{
  my $ppp = Crypt::PerfectPaperPasswords->new;
  isa_ok $ppp, 'Crypt::PerfectPaperPasswords';

  is $ppp->alphabet,
     '23456789!@#%+=:?'
   . 'abcdefghijkmnopqrstuvwxyz'
   . 'ABCDEFGHJKLMNPRSTUVWXYZ', "default alphabet OK";

  my $key     = 'Rosebud';
  my $exp_seq = '1727f9eedb5128f0cdf892ad31eac287'
   . 'ea16e261fd7ff9007037807c3ebc02dc';

  my $got_seq = $ppp->sequence_from_key( $key );
  is $got_seq, $exp_seq, "Sequence OK";

  my $rand_seq = $ppp->random_sequence;
  like $rand_seq, qr/^[0-9a-f]{64}$/i, "Random sequence looks good";

  # There's a small chance of this test failing sometime before the
  # universe goes dark. I can live with that.
  my $another_seq = $ppp->random_sequence;
  isnt $another_seq, $rand_seq, "Sequence didn't repeat";
}

my @schedule = (
  {
    name => 'Data from PHP implementation',
    key  => '1727f9eedb5128f0cdf892ad31eac287'
     . 'ea16e261fd7ff9007037807c3ebc02dc',
    expect => [
      'gHqx', 'L+ZF', 'LmJm', 'qxd4', 'Et3K', 'wasq', 'qBy+', 'KECu',
      'EcVD', '%Uss', 'e2@X', 'n%N!', 'V#ep', '%anU', '?hr8', 'mo%c',
      'Mqre', 'rHn#', 'ryGA', '%oJH', 'd6+x', 'ajaf', 'STcv', 'R2Pa',
      '%RCq', 'xkaT', 'LvWs', 'cBug', 'D632', 'zf4V', 'CYSx', 'jeUG',
      'Z+6b', '8Yib', '6tEi', '#o8v', 'f4KG', 'X@8P', 'q!oa', 'rjrj',
      'tVww', 'fMwz', 'kWDi', 'RWZS', 'euRN', 'Lekx', '82Ca', 'KSeF',
      'Vwbi', '!:jT', 'j4C2', '@dis', '@gvu', 'o#z2', '@nnc', 'LT4h',
      'Gh:M', 'LgPn', 'oDum', 'jf8p', 'm=S8', 'YgV4', '=vAa', 'KegM',
      'U@yS', ':uob', '8dnp', 'dTRC', '7wXm', 'h=du', 'wSdq', 'Ksnr',
      'TZRN', 'aL@G', 'n4jd', 'hSPi', 'xnVS', 'eWLF', 'vUiA', '8yZm',
      'z3?D', 'MVCG', 'obrB', '8NBs', 'W#WK', '@Ugi', 'kiFT', 'K3Wk',
      'aKfs', 'kEKX', ':Wcb', 'G=Mv', 'A??R', '4Pk#', ':jN?', '2TzP',
      'LBS3', '+g@k', '3=u%', 'DbaA',
    ]
  },
  {
    name   => 'Generated by grc.com',
    phrase => 'Grenade',
    expect => [
      '+U!8', 's9da', 'geGo', 'RFK7', 'nG2d', 'w6#=', '39@6', '6?2m',
      'KmyN', 'vJyE', '8j%d', '%8Ya', 'zS?S', '%z4o', 'indy', 'p3Go',
      'Bsjc', 'CaH#', 'BLM7', '2y2F', '%Vyt', '4?rm', 'oaX!', '4idq',
      '#i%r', '=deL', 'yGqf', 'tGUZ', 'gc+u', '8Tc2', 'okPy', ':!+3',
      'bVpk', 'RJWe', '=iVP', '2tRa', 'zED+', '=4T#', 'yT2t', 'AFup',
      'DSut', '2foS', '%UCe', 'oK##', 'ELEB', '2!Wj', 'ev#T', 'Wr58',
      'L2xe', '6hCq', '6d6B', 'fXU=', '@Et#', 'S38c', '%th7', 'CfeB',
      'JW:%', 'EuuP', 'R3+L', ':9b2', '3?m6', 'CKp=', 'x3Y=', 'mAPq',
      'VZke', 'm=HB', ':T3B', 'Z:Jy', '7zff', 'uyJD',
    ]
  },
  {
    name   => 'Generated by grc.com (page 2)',
    phrase => 'Grenade',
    first  => 2,
    expect => [
      'qa4d', 'u:2g', 'ufTq', 'VMfM', 'UZH#', 'TPGB', 'z99p', 'm6i3',
      'f8!d', 'et:!', 'Zs4!', 'ip=v', 'D3VV', 'S#5W', 'MdtA', 'z#U!',
      ':WZN', '6g?t', 'x2n2', 'GbD9', 'qH%J', 'C+Ba', 'V:U=', 'qkTc',
      'YoUU', 'qHAx', 'rcY8', '4%8b', '?@Fo', 'Ssog', 'u#t9', 'Mw!8',
      'vsJs', 'm!4f', 'KauC', 'GySr', 'e7yC', 'p9o8', 'U8=9', 'gkhs',
      '3Rnd', 'AEPA', 'DXCC', 'Uo=g', 'WS+!', 'E#Ny', 'K8:!', 'KRid',
      '+vM3', 'W=MS', 'VagD', ':dX+', 'iA:#', '#vde', 'Rzn3', 'NxvV',
      'j2r?', 'XtG6', 'K=%+', 'dGD6', '@29K', '6C3e', 'G4#D', '%4U7',
      '#5dK', '3n9g', 'DU@?', 'm6nd', 'it6F', 'KH=u',
    ]
  },
  {
    skip_if => [ 'Math::BigInt not available', sub { !_got_bigint() } ],
    name    => 'Double length',
    phrase  => 'Grenade',
    args   => { codelen => 6 },
    expect => [
      '+U!8s9da', 'geGoRFK7', 'nG2dw6#=', '39@66?2m',
      'KmyNvJyE', '8j%d%8Ya', 'zS?S%z4o', 'indyp3Go',
      'BsjcCaH#', 'BLM72y2F', '%Vyt4?rm', 'oaX!4idq',
      '#i%r=deL', 'yGqftGUZ', 'gc+u8Tc2', 'okPy:!+3',
      'bVpkRJWe', '=iVP2tRa', 'zED+=4T#', 'yT2tAFup',
      'DSut2foS', '%UCeoK##', 'ELEB2!Wj', 'ev#TWr58',
      'L2xe6hCq', '6d6BfXU=', '@Et#S38c', '%th7CfeB',
      'JW:%EuuP', 'R3+L:9b2', '3?m6CKp=', 'x3Y=mAPq',
      'VZkem=HB', ':T3BZ:Jy', '7zffuyJD',
    ]
  },
  {
    name   => 'Hexadecimal',
    phrase => 'Grenade',
    args   => { alphabet => '0123456789abcdef' },
    expect => [
      'c8e881', '1e1314', '615f67', '7bb271', 'cdb0c4', '521a43',
      '1c1901', '4c30c6', '2f676d', '46c76b', '646bc4', 'b81e34',
      '82ef0e', 'b0a247', '8173d9', 'e50f67', 'a68994', 'b240b2',
      'aec471', '0c908b', 'bce7a8', '2c30e6', 'd14d32', '2063d7',
      'a06b08', 'dc44dc', '7ebf55', '2ebaff', '694cc8', '64e210',
      'd966f9', 'e02c40', '1dee96', '77cc35', 'd06bbd', '088734',
      '86bc23', 'd809b2', '76e088', '9ab3a7', 'c2e3a8', '045d1e',
      'b8eb25', 'd9ca82', 'decdaa', '002c76', '419a4e', 'c38381',
      '330625', '4c5be7', '4c448a', '55fa73', '94b2a2', '870684',
      'b88751', 'b6549a', '13fec2', 'de83ad', '770ccc', 'ec1110',
      '1c3b11', 'bace53', '660e73', 'b5a6f7', 'bffa15', 'b530ba',
      'e4e18a', 'fb31f9', '50a555', '3e913b'
    ],
  },
  {
    name   => 'Letters',
    phrase => 'Grenade',
    args   => { alphabet => 'abcdefghijklmnopqrstuvw' },
    expect => [
      'aggrfa', 'ordgpa', 'cfrteb', 'nmsjfa', 'rcosra', 'wblhma',
      'nqfuda', 'ensgcb', 'pgefec', 'rmvqtb', 'mnewra', 'omoupa',
      'mnupgc', 'ieqeeb', 'ptssnb', 'nvoteb', 'aljfra', 'fdqbka',
      'colkfa', 'mtgcub', 'gqwjjb', 'uhnrcb', 'opwiia', 'bwjhgb',
      'gngdhb', 'abpbcc', 'bgddua', 'vfdunc', 'uffwjb', 'kgigaa',
      'ionhob', 'lkocba', 'fpnsbb', 'gmiota', 'agkkfc', 'kqjspa',
      'nrnula', 'rbpeka', 'mmttib', 'sajofb', 'akoijb', 'opjugc',
      'vupita', 'vwbmja', 'moharb', 'oeugbb', 'dwomhc', 'hlkpfa',
      'tfqgta', 'kplpgb', 'dfijqb', 'bovana', 'feduja', 'vltvqa',
      'vvoafa', 'sjroqb', 'mramka', 'vsjcfc', 'bauvbc', 'nlrfaa',
      'jbidea', 'wlkoma', 'eiwbna', 'lbhtgb', 'kwwcta', 'gfdbrb',
      'bomiqb', 'amtfob', 'fvqwta', 'efqvsb'
    ],
  },
  {
    name   => 'Vowels',
    phrase => 'Grenade',
    args   => { alphabet => 'aeiou' },
    expect => [
      'eeuuuuiauaa', 'ueuaeiouaia', 'aouiououuoa', 'uoaouaiuoaa',
      'iuaauuooiia', 'aaaoooauoea', 'uiaiiiuoiaa', 'iauaeaoaooa',
      'uaeeoiuuaie', 'euaaaiaoaee', 'ouauooeuiia', 'eaeuioueeia',
      'oaaeioooiie', 'uiioaeiiuoa', 'eeaeaiueeae', 'ieeoeuouuoa',
      'euaaiooeiia', 'aouiaiaeiea', 'ooaeooiuoaa', 'auuoiueuaee',
      'iaieiuaeoua', 'iueuaieiooa', 'eiiueeaaeea', 'eaoeuaaaeua',
      'aioeeuuieua', 'oouuouaiuee', 'iueaeoaiuia', 'ieiaueiuioe',
      'eouiaiaooua', 'ieauouuaaaa', 'ooueuiooeae', 'iuiuouuoaaa',
      'ioeuieuoioa', 'eeoueieauia', 'uiueoieueie', 'aiauuuieeia',
      'iuuaeaoioea', 'oaiaooieiea', 'oeoieoauiua', 'aoeaioiiaua',
      'ueauauuaoua', 'ioieaeiuiie', 'eeueeaiuoia', 'uaaaaoaueea',
      'iaieeoeooae', 'iuuouaaiioa', 'iouoeaueoie', 'aiaouieauaa',
      'uaooiiauoia', 'ooiieieeeua', 'iaeeuoaeoae', 'aouuoioeuea',
      'ooooeueaiea', 'oieeuioaiia', 'aoueeaaooaa', 'aeueuuueoae',
      'ioioeioiiea', 'eueeieaoeie', 'aououooeuee', 'uooaiiuaaaa',
      'uaaeeeuuiaa', 'auueuaeauea', 'eaiaueueuea', 'uueiaiueeua',
      'iooiaoiooia', 'aoaaieiooae', 'eeiioaaeoae', 'uaeiaeioeae',
      'aeuouuieuia', 'euiaaeeaaee'
    ],
  },
);

for my $test ( @schedule ) {
  my $name = $test->{name};
  SKIP: {
    if ( my $skip_if = $test->{skip_if} ) {
      my ( $reason, $test ) = @$skip_if;
      if ( $test->() ) {
        skip $reason => 2;
      }
    }
    my %args = %{ $test->{args} || {} };
    my $first = $test->{first} || 1;
    my $ppp = Crypt::PerfectPaperPasswords->new( %args );
    my $key
     = exists $test->{key}
     ? $test->{key}
     : $ppp->sequence_from_key( $test->{phrase} );
    my @expect = @{ $test->{expect} };
    is length( $key ), 64, "$name: Key length OK";
    my @got = $ppp->passcodes( $first, scalar @expect, $key );
    is_deeply \@got, \@expect, "$name: Passcodes match";
    # use Data::Dumper;
    # diag Dumper( \@got );
  }
}

{
  my $GOT_BIGINT;

  sub _got_bigint {
    defined $GOT_BIGINT and return $GOT_BIGINT;
    return $GOT_BIGINT = eval 'use Math::BigInt; 1' ? 1 : 0;
  }
}

# encoding: utf-8

require 'fnv_hash'

describe 'digest' do
  [
    "", 0xcbf29ce484222325,
    "a", 0xaf63dc4c8601ec8c,
    "b", 0xaf63df4c8601f1a5,
    "c", 0xaf63de4c8601eff2,
    "d", 0xaf63d94c8601e773,
    "e", 0xaf63d84c8601e5c0,
    "f", 0xaf63db4c8601ead9,
    "fo", 0x08985907b541d342,
    "foo", 0xdcb27518fed9d577,
    "foob", 0xdd120e790c2512af,
    "fooba", 0xcac165afa2fef40a,
    "foobar", 0x85944171f73967e8,
    "\0", 0xaf63bd4c8601b7df,
    "a\0", 0x089be207b544f1e4,
    "b\0", 0x08a61407b54d9b5f,
    "c\0", 0x08a2ae07b54ab836,
    "d\0", 0x0891b007b53c4869,
    "e\0", 0x088e4a07b5396540,
    "f\0", 0x08987c07b5420ebb,
    "fo\0", 0xdcb28a18fed9f926,
    "foo\0", 0xdd1270790c25b935,
    "foob\0", 0xcac146afa2febf5d,
    "fooba\0", 0x8593d371f738acfe,
    "foobar\0", 0x34531ca7168b8f38,
    "ch", 0x08a25607b54a22ae,
    "cho", 0xf5faf0190cf90df3,
    "chon", 0xf27397910b3221c7,
    "chong", 0x2c8c2b76062f22e0,
    "chongo", 0xe150688c8217b8fd,
    "chongo ", 0xf35a83c10e4f1f87,
    "chongo w", 0xd1edd10b507344d0,
    "chongo wa", 0x2a5ee739b3ddb8c3,
    "chongo was", 0xdcfb970ca1c0d310,
    "chongo was ", 0x4054da76daa6da90,
    "chongo was h", 0xf70a2ff589861368,
    "chongo was he", 0x4c628b38aed25f17,
    "chongo was her", 0x9dd1f6510f78189f,
    "chongo was here", 0xa3de85bd491270ce,
    "chongo was here!", 0x858e2fa32a55e61d,
    "chongo was here!\n", 0x46810940eff5f915,
    "ch\0", 0xf5fadd190cf8edaa,
    "cho\0", 0xf273ed910b32b3e9,
    "chon\0", 0x2c8c5276062f6525,
    "chong\0", 0xe150b98c821842a0,
    "chongo\0", 0xf35aa3c10e4f55e7,
    "chongo \0", 0xd1ed680b50729265,
    "chongo w\0", 0x2a5f0639b3dded70,
    "chongo wa\0", 0xdcfbaa0ca1c0f359,
    "chongo was\0", 0x4054ba76daa6a430,
    "chongo was \0", 0xf709c7f5898562b0,
    "chongo was h\0", 0x4c62e638aed2f9b8,
    "chongo was he\0", 0x9dd1a8510f779415,
    "chongo was her\0", 0xa3de2abd4911d62d,
    "chongo was here\0", 0x858e0ea32a55ae0a,
    "chongo was here!\0", 0x46810f40eff60347,
    "chongo was here!\n\0", 0xc33bce57bef63eaf,
    "cu", 0x08a24307b54a0265,
    "cur", 0xf5b9fd190cc18d15,
    "curd", 0x4c968290ace35703,
    "curds", 0x07174bd5c64d9350,
    "curds ", 0x5a294c3ff5d18750,
    "curds a", 0x05b3c1aeb308b843,
    "curds an", 0xb92a48da37d0f477,
    "curds and", 0x73cdddccd80ebc49,
    "curds and ", 0xd58c4c13210a266b,
    "curds and w", 0xe78b6081243ec194,
    "curds and wh", 0xb096f77096a39f34,
    "curds and whe", 0xb425c54ff807b6a3,
    "curds and whey", 0x23e520e2751bb46e,
    "curds and whey\n", 0x1a0b44ccfe1385ec,
    "cu\0", 0xf5ba4b190cc2119f,
    "cur\0", 0x4c962690ace2baaf,
    "curd\0", 0x0716ded5c64cda19,
    "curds\0", 0x5a292c3ff5d150f0,
    "curds \0", 0x05b3e0aeb308ecf0,
    "curds a\0", 0xb92a5eda37d119d9,
    "curds an\0", 0x73ce41ccd80f6635,
    "curds and\0", 0xd58c2c132109f00b,
    "curds and \0", 0xe78baf81243f47d1,
    "curds and w\0", 0xb0968f7096a2ee7c,
    "curds and wh\0", 0xb425a84ff807855c,
    "curds and whe\0", 0x23e4e9e2751b56f9,
    "curds and whey\0", 0x1a0b4eccfe1396ea,
    "curds and whey\n\0", 0x54abd453bb2c9004,
    "hi", 0x08ba5f07b55ec3da,
    "hi\0", 0x337354193006cb6e,
    "hello", 0xa430d84680aabd0b,
    "hello\0", 0xa9bc8acca21f39b1,
    "\xff\x00\x00\x01", 0x6961196491cc682d,
    "\x01\x00\x00\xff", 0xad2bb1774799dfe9,
    "\xff\x00\x00\x02", 0x6961166491cc6314,
    "\x02\x00\x00\xff", 0x8d1bb3904a3b1236,
    "\xff\x00\x00\x03", 0x6961176491cc64c7,
    "\x03\x00\x00\xff", 0xed205d87f40434c7,
    "\xff\x00\x00\x04", 0x6961146491cc5fae,
    "\x04\x00\x00\xff", 0xcd3baf5e44f8ad9c,
    "\x40\x51\x4e\x44", 0xe3b36596127cd6d8,
    "\x44\x4e\x51\x40", 0xf77f1072c8e8a646,
    "\x40\x51\x4e\x4a", 0xe3b36396127cd372,
    "\x4a\x4e\x51\x40", 0x6067dce9932ad458,
    "\x40\x51\x4e\x54", 0xe3b37596127cf208,
    "\x54\x4e\x51\x40", 0x4b7b10fa9fe83936,
    "127.0.0.1", 0xaabafe7104d914be,
    "127.0.0.1\0", 0xf4d3180b3cde3eda,
    "127.0.0.2", 0xaabafd7104d9130b,
    "127.0.0.2\0", 0xf4cfb20b3cdb5bb1,
    "127.0.0.3", 0xaabafc7104d91158,
    "127.0.0.3\0", 0xf4cc4c0b3cd87888,
    "64.81.78.68", 0xe729bac5d2a8d3a7,
    "64.81.78.68\0", 0x74bc0524f4dfa4c5,
    "64.81.78.74", 0xe72630c5d2a5b352,
    "64.81.78.74\0", 0x6b983224ef8fb456,
    "64.81.78.84", 0xe73042c5d2ae266d,
    "64.81.78.84\0", 0x8527e324fdeb4b37,
    "feedface", 0x0a83c86fee952abc,
    "feedface\0", 0x7318523267779d74,
    "feedfacedaffdeed", 0x3e66d3d56b8caca1,
    "feedfacedaffdeed\0", 0x956694a5c0095593,
    "feedfacedeadbeef", 0xcac54572bb1a6fc8,
    "feedfacedeadbeef\0", 0xa7a4c9f3edebf0d8,
    "line 1\nline 2\nline 3", 0x7829851fac17b143,
    "chongo <Landon Curt Noll> /\\../\\", 0x2c8f4c9af81bcf06,
    "chongo <Landon Curt Noll> /\\../\\\0", 0xd34e31539740c732,
    "chongo (Landon Curt Noll) /\\../\\", 0x3605a2ac253d2db1,
    "chongo (Landon Curt Noll) /\\../\\\0", 0x08c11b8346f4a3c3,
    "http://antwrp.gsfc.nasa.gov/apod/astropix.html", 0x6be396289ce8a6da,
    "http://en.wikipedia.org/wiki/Fowler_Noll_Vo_hash", 0xd9b957fb7fe794c5,
    "http://epod.usra.edu/", 0x05be33da04560a93,
    "http://exoplanet.eu/", 0x0957f1577ba9747c,
    "http://hvo.wr.usgs.gov/cam3/", 0xda2cc3acc24fba57,
    "http://hvo.wr.usgs.gov/cams/HMcam/", 0x74136f185b29e7f0,
    "http://hvo.wr.usgs.gov/kilauea/update/deformation.html", 0xb2f2b4590edb93b2,
    "http://hvo.wr.usgs.gov/kilauea/update/images.html", 0xb3608fce8b86ae04,
    "http://hvo.wr.usgs.gov/kilauea/update/maps.html", 0x4a3a865079359063,
    "http://hvo.wr.usgs.gov/volcanowatch/current_issue.html", 0x5b3a7ef496880a50,
    "http://neo.jpl.nasa.gov/risk/", 0x48fae3163854c23b,
    "http://norvig.com/21-days.html", 0x07aaa640476e0b9a,
    "http://primes.utm.edu/curios/home.php", 0x2f653656383a687d,
    "http://slashdot.org/", 0xa1031f8e7599d79c,
    "http://tux.wr.usgs.gov/Maps/155.25-19.5.html", 0xa31908178ff92477,
    "http://volcano.wr.usgs.gov/kilaueastatus.php", 0x097edf3c14c3fb83,
    "http://www.avo.alaska.edu/activity/Redoubt.php", 0xb51ca83feaa0971b,
    "http://www.dilbert.com/fast/", 0xdd3c0d96d784f2e9,
    "http://www.fourmilab.ch/gravitation/orbits/", 0x86cd26a9ea767d78,
    "http://www.fpoa.net/", 0xe6b215ff54a30c18,
    "http://www.ioccc.org/index.html", 0xec5b06a1c5531093,
    "http://www.isthe.com/cgi-bin/number.cgi", 0x45665a929f9ec5e5,
    "http://www.isthe.com/chongo/bio.html", 0x8c7609b4a9f10907,
    "http://www.isthe.com/chongo/index.html", 0x89aac3a491f0d729,
    "http://www.isthe.com/chongo/src/calc/lucas-calc", 0x32ce6b26e0f4a403,
    "http://www.isthe.com/chongo/tech/astro/venus2004.html", 0x614ab44e02b53e01,
    "http://www.isthe.com/chongo/tech/astro/vita.html", 0xfa6472eb6eef3290,
    "http://www.isthe.com/chongo/tech/comp/c/expert.html", 0x9e5d75eb1948eb6a,
    "http://www.isthe.com/chongo/tech/comp/calc/index.html", 0xb6d12ad4a8671852,
    "http://www.isthe.com/chongo/tech/comp/fnv/index.html", 0x88826f56eba07af1,
    "http://www.isthe.com/chongo/tech/math/number/howhigh.html", 0x44535bf2645bc0fd,
    "http://www.isthe.com/chongo/tech/math/number/number.html", 0x169388ffc21e3728,
    "http://www.isthe.com/chongo/tech/math/prime/mersenne.html", 0xf68aac9e396d8224,
    "http://www.isthe.com/chongo/tech/math/prime/mersenne.html#largest", 0x8e87d7e7472b3883,
    "http://www.lavarnd.org/cgi-bin/corpspeak.cgi", 0x295c26caa8b423de,
    "http://www.lavarnd.org/cgi-bin/haiku.cgi", 0x322c814292e72176,
    "http://www.lavarnd.org/cgi-bin/rand-none.cgi", 0x8a06550eb8af7268,
    "http://www.lavarnd.org/cgi-bin/randdist.cgi", 0xef86d60e661bcf71,
    "http://www.lavarnd.org/index.html", 0x9e5426c87f30ee54,
    "http://www.lavarnd.org/what/nist-test.html", 0xf1ea8aa826fd047e,
    "http://www.macosxhints.com/", 0x0babaf9a642cb769,
    "http://www.mellis.com/", 0x4b3341d4068d012e,
    "http://www.nature.nps.gov/air/webcams/parks/havoso2alert/havoalert.cfm", 0xd15605cbc30a335c,
    "http://www.nature.nps.gov/air/webcams/parks/havoso2alert/timelines_24.cfm", 0x5b21060aed8412e5,
    "http://www.paulnoll.com/", 0x45e2cda1ce6f4227,
    "http://www.pepysdiary.com/", 0x50ae3745033ad7d4,
    "http://www.sciencenews.org/index/home/activity/view", 0xaa4588ced46bf414,
    "http://www.skyandtelescope.com/", 0xc1b0056c4a95467e,
    "http://www.sput.nl/~rob/sirius.html", 0x56576a71de8b4089,
    "http://www.systemexperts.com/", 0xbf20965fa6dc927e,
    "http://www.tq-international.com/phpBB3/index.php", 0x569f8383c2040882,
    "http://www.travelquesttours.com/index.htm", 0xe1e772fba08feca0,
    "http://www.wunderground.com/global/stations/89606.html", 0x4ced94af97138ac4,
    "21701" * 10, 0xc4112ffb337a82fb,
    "M21701" * 10, 0xd64a4fd41de38b7d,
    "2^21701-1" * 10, 0x4cfc32329edebcbb,
    "\x54\xc5" * 10, 0x0803564445050395,
    "\xc5\x54" * 10, 0xaa1574ecf4642ffd,
    "23209" * 10, 0x694bc4e54cc315f9,
    "M23209" * 10, 0xa3d7cb273b011721,
    "2^23209-1" * 10, 0x577c2f8b6115bfa5,
    "\x5a\xa9" * 10, 0xb7ec8c1a769fb4c1,
    "\xa9\x5a" * 10, 0x5d5cfce63359ab19,
    "391581216093" * 10, 0x33b96c3cd65b5f71,
    "391581*2^216093-1" * 10, 0xd845097780602bb9,
    "\x05\xf9\x9d\x03\x4c\x81" * 10, 0x84d47645d02da3d5,
    "FEDCBA9876543210" * 10, 0x83544f33b58773a5,
    "\xfe\xdc\xba\x98\x76\x54\x32\x10" * 10, 0x9175cbb2160836c5,
    "EFCDAB8967452301" * 10, 0xc71b3bc175e72bc5,
    "\xef\xcd\xab\x89\x67\x45\x23\x01" * 10, 0x636806ac222ec985,
    "0123456789ABCDEF" * 10, 0xb6ef0e6950f52ed5,
    "\x01\x23\x45\x67\x89\xab\xcd\xef" * 10, 0xead3d8a0f3dfdaa5,
    "1032547698BADCFE" * 10, 0x922908fe9a861ba5,
    "\x10\x32\x54\x76\x98\xba\xdc\xfe" * 10, 0x6d4821de275fd5c5,
    "\x00" * 500, 0x1fe3fce62bd816b5,
    "\x07" * 500, 0xc23e9fccd6f70591,
    "~" * 500, 0xc1af12bdfe16b5b5,
    "\x7f" * 500, 0x39e9f18f2f85e221,
  ].each_slice(2) do |input, out|
    it "produces #{out} given #{input}" do
      expect(FnvHash.digest(input)).to eq(out)
    end
  end
end
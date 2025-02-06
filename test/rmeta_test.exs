defmodule TikaServerEx.RMetaTest do
  use ExUnit.Case

  @tika_server TikaServerEx.new("http://localhost:9998")

  test "get_text_content(.html)" do
    bytes =
      File.read!(
        "test/fixtures/Tapioca DAO stops 1,000 ETH worth $2.7 million from being stolen following exploit that drains majority of its funds.html"
      )

    {:ok, response} = TikaServerEx.RMeta.get_text_content(@tika_server, bytes)
    assert response.status == 200

    [
      %{
        "Content-Encoding" => "UTF-8",
        "Content-Language" => "en",
        "Content-Length" => "18141",
        "Content-Type" => "text/html; charset=UTF-8",
        "Content-Type-Hint" => "text/html; charset=UTF-8",
        "X-TIKA:Parsed-By" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.html.JSoupParser"
        ],
        "X-TIKA:Parsed-By-Full-Set" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.html.JSoupParser"
        ],
        "X-TIKA:content_handler" => "ToTextContentHandler",
        "X-TIKA:detectedEncoding" => "UTF-8",
        "X-TIKA:embedded_depth" => "0",
        "X-TIKA:encodingDetector" => "HtmlEncodingDetector",
        "dc:title" =>
          "Tapioca DAO stops 1,000 ETH worth $2.7 million from being stolen following exploit that drains majority of its funds"
      }
    ] = response.body
    content = get_in(response.body, [Access.at(0), "X-TIKA:content"])
    assert String.starts_with?(content, "\n\n\n\n\n\n\n\n\n\n\n\nTapioca DAO stops 1,000 ETH worth $2.7 million from being stolen following exploit that drains majority of its funds\n\n\n   \n  \n    www.theblock.co\n    /post/322061/tapioca-dao-stops-1000-eth-worth-2-7-million-from-being-stolen-following-exploit-that-drains-majority-of-its-funds\n  \n  Tapioca DAO stops 1,000 ETH worth $2.7 million from being stolen following exploit that drains majority of its funds\n\n  Daniel Kuhn\n  5-6 minutes\n  10/18/2024\n  \n\n  Security\n      • October 18, 2024, 4:30PM EDT\n    \n \n   Published  1 minute earlier   on \n\n \n\nQuick Take\n\n\tAn exploiter, possibly a Norther Korean hacker, was able to obtain the private keys in a social engineering attack that drained $4.4 million worth of cryptocurrencies, the Tapioca Foundation said.\n\n\tThe organization worked with the emergency response team SEAL911 and others to recover assets the exploiter had missed.\n\n\n\n\nThe Tapioca DAO suffered a massive exploit leading to an over 95% drawdown in the TAP token price. About $4.5 million worth of cryptocurrencies were stolen, though the team says it's in the process of recovering funds with assistance from web3 security firm Fuzzland and others.\n\"All current Tapioca DAO Platform users are advised to revoke approvals to our Contracts until the recent Compromise has been resolved,” the Tapioca Foundation said on X. “Please reach out to website support upon any issues revoking approvals.\"\nAccording to the foundation, the attacker was able to compromise the token’s vesting contract giving him access to sell its 30 million vested TAP tokens — at the time worth around $1.40, now worth less than $0.04 — as well as the USDO stablecoin contract.\nIn total, the attacker walked away with about $4,405,600, including $2.8 million USDC and $\u200B\u200B1,575,606 in ETH drained from the USDO/USDC liquidity pair. The stolen funds were swapped for ETH, then USDT, and then bridged from Arbitrum to BNB Chain where, at press time, they remain.\nTapioca is a decentralized money market protocol based on LayerZero for borrowing cryptocurrencies across multiple blockchains. It uses a stablecoin called USDO and Tapioca Omnichain Fungible Tokens (TOFTs) to enable users to move wrapped assets between networks.\nAccording to Fuzzland, it seems likely the attacker obtained the private keys through social engineering. On Discord, Tapioca co-founder Matt Marino said Discord member 0xRektora was contacted about a friend being hired, which tricked him into lowering his guard enough to connect the hardware wallet that the attacker used to gain ownership of TAP.\n“North Korea is always the garbage collector here,” Fuzzland said, echoing ZachXBT that the connection to the Hermit Kingdom has not yet been proven and that the situation is “complicated.”\nThose attacks “were the result of fake job scams” where North Korean actors posed as interview subjects or vendors to gain inside access or information needed to steal funds, ZachXBT said. There have been a slew of anecdotes and a recent CoinDesk investigation suggesting this type of “contagious interview” scam is a widespread and growing issue across crypto.\nRecovering funds?\n“We have coordinated and are active in a war room with the necessary individuals and entities to proceed forward, and will be communicating on further steps when the situation is under control,” the foundation wrote.\nTony, a security engineer at Fuzzland and member of the volunteer emergency response team SEAL911, was one of the members in the war room, which worked to help them recover a portion of the funds that the hacker didn't notice, he told The Block.\nAccording to Marino on Discord, the organization moved 1,000 ETH worth about $2.7 million from a vault to a secure location — the DAO multisig. \"The 1000 ETH was DAO collateral within Big Bang Origins to mint USDO for USDO/USDC LP,\" he added.\n\"The team attempted to rescue these assets by first approving the Multicall, which anyone can take away these assets. Luckily, no one found out and they managed to still rescue these assets,\" Fuzzland co-founder Chaofan Shou told The Block.\nHowever, the ")
  end

  test "get_xml_content(.docx)" do
    bytes = File.read!("test/fixtures/story.docx")
    {:ok, response} = TikaServerEx.RMeta.get_xml_content(@tika_server, bytes)
    assert response.status == 200

    [
      %{
        "Content-Length" => "4445312",
        "Content-Type" =>
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        "X-TIKA:Parsed-By" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.microsoft.ooxml.OOXMLParser"
        ],
        "X-TIKA:Parsed-By-Full-Set" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.microsoft.ooxml.OOXMLParser",
          "org.apache.tika.parser.image.ImageParser"
        ],
        "X-TIKA:content" =>
          "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n<meta name=\"X-TIKA:Parsed-By\" content=\"org.apache.tika.parser.DefaultParser\" />\n<meta name=\"X-TIKA:Parsed-By\" content=\"org.apache.tika.parser.microsoft.ooxml.OOXMLParser\" />\n<meta name=\"extended-properties:DocSecurityString\" content=\"None\" />\n<meta name=\"Content-Length\" content=\"4445312\" />\n<meta name=\"Content-Type\" content=\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\" />\n<title></title>\n</head>\n<body><p />\n<p>Once upon a time, in a small village nestled in the mountains, there lived a young</p>\n<p>girl named Lily. She was known throughout the village for her kind heart and</p>\n<p>adventurous spirit. One day, while exploring the forest, she stumbled upon a</p>\n<p>hidden cave and inside, she found a magical amulet that granted her the power to</p>\n<p>talk to animals.</p>\n<p />\n<p>Lily was born on November 22, 1990.<img src=\"embedded:image1.png\" alt=\"CleanShot 2025-01-03 at 14.09.57@2x.png\" /></p>\n<p />\n<p>Excited by her newfound ability, Lily spent her days conversing with the creatures</p>\n<p>of the forest and helping them with their problems. She became beloved by all the</p>\n<p>animals and soon, word of her magical powers spread throughout the village. People</p>\n<p>came from far and wide to seek her help and she became known as the protector of</p>\n<p>the forest. From that day on, Lily lived a life filled with adventure and wonder,</p>\n<p>always surrounded by the creatures she loved and protected.</p>\n<p />\n<div class=\"package-entry\"><h1>image1.png</h1>\n</div>\n</body></html>",
        "X-TIKA:content_handler" => "ToXMLContentHandler",
        "X-TIKA:embedded_depth" => "0",
        "extended-properties:DocSecurityString" => "None"
      },
      %{
        "tiff:BitsPerSample" => "8 8 8 8",
        "Text TextEntry" =>
          "keyword=XML:com.adobe.xmp, value=<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 6.0.0\">\n   <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n      <rdf:Description rdf:about=\"\"\n            xmlns:exif=\"http://ns.adobe.com/exif/1.0/\">\n         <exif:PixelYDimension>1304</exif:PixelYDimension>\n         <exif:PixelXDimension>1742</exif:PixelXDimension>\n         <exif:UserComment>Screenshot</exif:UserComment>\n      </rdf:Description>\n   </rdf:RDF>\n</x:xmpmeta>, language=, compression=none",
        "Dimension PixelAspectRatio" => "1.0",
        "Compression NumProgressiveScans" => "1",
        "Dimension HorizontalPixelSize" => "0.17639795",
        "Chroma NumChannels" => "4",
        "Chroma BlackIsZero" => "true",
        "Transparency Alpha" => "nonpremultipled",
        "Data BitsPerSample" => "8 8 8 8",
        "width" => "1742",
        "X-TIKA:Parsed-By" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.image.ImageParser"
        ],
        "X-TIKA:final_embedded_resource_path" => "/image1.png",
        "Data SampleFormat" => "UnsignedIntegral",
        "resourceName" => "image1.png",
        "Content-Type" => "image/png",
        "X-TIKA:embedded_depth" => "1",
        "X-TIKA:content" =>
          "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n<meta name=\"Transparency Alpha\" content=\"nonpremultipled\" />\n<meta name=\"X-TIKA:embedded_id_path\" content=\"/1\" />\n<meta name=\"tiff:ImageLength\" content=\"1304\" />\n<meta name=\"Compression CompressionTypeName\" content=\"deflate\" />\n<meta name=\"Data BitsPerSample\" content=\"8 8 8 8\" />\n<meta name=\"Data PlanarConfiguration\" content=\"PixelInterleaved\" />\n<meta name=\"Dimension VerticalPixelSize\" content=\"0.17639795\" />\n<meta name=\"IHDR\" content=\"width=1742, height=1304, bitDepth=8, colorType=RGBAlpha, compressionMethod=deflate, filterMethod=adaptive, interlaceMethod=none\" />\n<meta name=\"embeddedRelationshipId\" content=\"rId4\" />\n<meta name=\"embeddedResourceType\" content=\"INLINE\" />\n<meta name=\"iCCP\" content=\"profileName=ICC Profile, compressionMethod=deflate\" />\n<meta name=\"Chroma ColorSpaceType\" content=\"RGB\" />\n<meta name=\"tiff:BitsPerSample\" content=\"8 8 8 8\" />\n<meta name=\"X-TIKA:embedded_id\" content=\"1\" />\n<meta name=\"Content-Type\" content=\"image/png\" />\n<meta name=\"height\" content=\"1304\" />\n<meta name=\"imagereader:NumImages\" content=\"1\" />\n<meta name=\"pHYs\" content=\"pixelsPerUnitXAxis=5669, pixelsPerUnitYAxis=5669, unitSpecifier=meter\" />\n<meta name=\"Text TextEntry\" content=\"keyword=XML:com.adobe.xmp, value=&lt;x:xmpmeta xmlns:x=&quot;adobe:ns:meta/&quot; x:xmptk=&quot;XMP Core 6.0.0&quot;&gt;\n   &lt;rdf:RDF xmlns:rdf=&quot;http://www.w3.org/1999/02/22-rdf-syntax-ns#&quot;&gt;\n      &lt;rdf:Description rdf:about=&quot;&quot;\n            xmlns:exif=&quot;http://ns.adobe.com/exif/1.0/&quot;&gt;\n         &lt;exif:PixelYDimension&gt;1304&lt;/exif:PixelYDimension&gt;\n         &lt;exif:PixelXDimension&gt;1742&lt;/exif:PixelXDimension&gt;\n         &lt;exif:UserComment&gt;Screenshot&lt;/exif:UserComment&gt;\n      &lt;/rdf:Description&gt;\n   &lt;/rdf:RDF&gt;\n&lt;/x:xmpmeta&gt;, language=, compression=none\" />\n<meta name=\"Dimension PixelAspectRatio\" content=\"1.0\" />\n<meta name=\"resourceName\" content=\"image1.png\" />\n<meta name=\"UnknownChunks UnknownChunk\" content=\"eXIf\" />\n<meta name=\"UnknownChunks UnknownChunk\" content=\"iDOT\" />\n<meta name=\"iTXt iTXtEntry\" content=\"keyword=XML:com.adobe.xmp, compressionFlag=false, compressionMethod=0, languageTag=, translatedKeyword=, text=&lt;x:xmpmeta xmlns:x=&quot;adobe:ns:meta/&quot; x:xmptk=&quot;XMP Core 6.0.0&quot;&gt;\n   &lt;rdf:RDF xmlns:rdf=&quot;http://www.w3.org/1999/02/22-rdf-syntax-ns#&quot;&gt;\n      &lt;rdf:Description rdf:about=&quot;&quot;\n            xmlns:exif=&quot;http://ns.adobe.com/exif/1.0/&quot;&gt;\n         &lt;exif:PixelYDimension&gt;1304&lt;/exif:PixelYDimension&gt;\n         &lt;exif:PixelXDimension&gt;1742&lt;/exif:PixelXDimension&gt;\n         &lt;exif:UserComment&gt;Screenshot&lt;/exif:UserComment&gt;\n      &lt;/rdf:Description&gt;\n   &lt;/rdf:RDF&gt;\n&lt;/x:xmpmeta&gt;\" />\n<meta name=\"Compression NumProgressiveScans\" content=\"1\" />\n<meta name=\"X-TIKA:Parsed-By\" content=\"org.apache.tika.parser.DefaultParser\" />\n<meta name=\"X-TIKA:Parsed-By\" content=\"org.apache.tika.parser.image.ImageParser\" />\n<meta name=\"Dimension HorizontalPixelSize\" content=\"0.17639795\" />\n<meta name=\"Chroma BlackIsZero\" content=\"true\" />\n<meta name=\"Compression Lossless\" content=\"true\" />\n<meta name=\"X-TIKA:embedded_depth\" content=\"1\" />\n<meta name=\"width\" content=\"1742\" />\n<meta name=\"Dimension ImageOrientation\" content=\"Normal\" />\n<meta name=\"X-TIKA:embedded_resource_path\" content=\"/image1.png\" />\n<meta name=\"tiff:ImageWidth\" content=\"1742\" />\n<meta name=\"Chroma NumChannels\" content=\"4\" />\n<meta name=\"Data SampleFormat\" content=\"UnsignedIntegral\" />\n<title></title>\n</head>\n<body /></html>",
        "X-TIKA:content_handler" => "ToXMLContentHandler",
        "Compression Lossless" => "true",
        "pHYs" => "pixelsPerUnitXAxis=5669, pixelsPerUnitYAxis=5669, unitSpecifier=meter",
        "X-TIKA:embedded_id" => "1",
        "tiff:ImageLength" => "1304",
        "embeddedResourceType" => "INLINE",
        "IHDR" =>
          "width=1742, height=1304, bitDepth=8, colorType=RGBAlpha, compressionMethod=deflate, filterMethod=adaptive, interlaceMethod=none",
        "UnknownChunks UnknownChunk" => ["eXIf", "iDOT"],
        "X-TIKA:embedded_resource_path" => "/image1.png",
        "embeddedRelationshipId" => "rId4",
        "tiff:ImageWidth" => "1742",
        "Compression CompressionTypeName" => "deflate",
        "height" => "1304",
        "Chroma ColorSpaceType" => "RGB",
        "Dimension ImageOrientation" => "Normal",
        "Dimension VerticalPixelSize" => "0.17639795",
        "iCCP" => "profileName=ICC Profile, compressionMethod=deflate",
        "imagereader:NumImages" => "1",
        "Data PlanarConfiguration" => "PixelInterleaved",
        "X-TIKA:embedded_id_path" => "/1",
        "iTXt iTXtEntry" =>
          "keyword=XML:com.adobe.xmp, compressionFlag=false, compressionMethod=0, languageTag=, translatedKeyword=, text=<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 6.0.0\">\n   <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n      <rdf:Description rdf:about=\"\"\n            xmlns:exif=\"http://ns.adobe.com/exif/1.0/\">\n         <exif:PixelYDimension>1304</exif:PixelYDimension>\n         <exif:PixelXDimension>1742</exif:PixelXDimension>\n         <exif:UserComment>Screenshot</exif:UserComment>\n      </rdf:Description>\n   </rdf:RDF>\n</x:xmpmeta>"
      }
    ] = response.body
  end

  test "get_text_content(.docx)" do
    bytes = File.read!("test/fixtures/story.docx")
    {:ok, response} = TikaServerEx.RMeta.get_text_content(@tika_server, bytes)
    assert response.status == 200

    [
      %{
        "Content-Length" => "4445312",
        "Content-Type" =>
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        "X-TIKA:Parsed-By" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.microsoft.ooxml.OOXMLParser"
        ],
        "X-TIKA:Parsed-By-Full-Set" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.microsoft.ooxml.OOXMLParser",
          "org.apache.tika.parser.image.ImageParser"
        ],
        "X-TIKA:content" =>
          "\n\n\n\n\n\n\n\n\n\nOnce upon a time, in a small village nestled in the mountains, there lived a young\ngirl named Lily. She was known throughout the village for her kind heart and\nadventurous spirit. One day, while exploring the forest, she stumbled upon a\nhidden cave and inside, she found a magical amulet that granted her the power to\ntalk to animals.\n\nLily was born on November 22, 1990.\n\nExcited by her newfound ability, Lily spent her days conversing with the creatures\nof the forest and helping them with their problems. She became beloved by all the\nanimals and soon, word of her magical powers spread throughout the village. People\ncame from far and wide to seek her help and she became known as the protector of\nthe forest. From that day on, Lily lived a life filled with adventure and wonder,\nalways surrounded by the creatures she loved and protected.\n\nimage1.png\n\n",
        "X-TIKA:content_handler" => "ToTextContentHandler",
        "X-TIKA:embedded_depth" => "0",
        "extended-properties:DocSecurityString" => "None"
      },
      %{
        "tiff:BitsPerSample" => "8 8 8 8",
        "Text TextEntry" =>
          "keyword=XML:com.adobe.xmp, value=<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 6.0.0\">\n   <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n      <rdf:Description rdf:about=\"\"\n            xmlns:exif=\"http://ns.adobe.com/exif/1.0/\">\n         <exif:PixelYDimension>1304</exif:PixelYDimension>\n         <exif:PixelXDimension>1742</exif:PixelXDimension>\n         <exif:UserComment>Screenshot</exif:UserComment>\n      </rdf:Description>\n   </rdf:RDF>\n</x:xmpmeta>, language=, compression=none",
        "Dimension PixelAspectRatio" => "1.0",
        "Compression NumProgressiveScans" => "1",
        "Dimension HorizontalPixelSize" => "0.17639795",
        "Chroma NumChannels" => "4",
        "Chroma BlackIsZero" => "true",
        "Transparency Alpha" => "nonpremultipled",
        "Data BitsPerSample" => "8 8 8 8",
        "width" => "1742",
        "X-TIKA:Parsed-By" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.image.ImageParser"
        ],
        "X-TIKA:final_embedded_resource_path" => "/image1.png",
        "Data SampleFormat" => "UnsignedIntegral",
        "resourceName" => "image1.png",
        "Content-Type" => "image/png",
        "X-TIKA:embedded_depth" => "1",
        "Compression Lossless" => "true",
        "pHYs" => "pixelsPerUnitXAxis=5669, pixelsPerUnitYAxis=5669, unitSpecifier=meter",
        "X-TIKA:embedded_id" => "1",
        "tiff:ImageLength" => "1304",
        "embeddedResourceType" => "INLINE",
        "IHDR" =>
          "width=1742, height=1304, bitDepth=8, colorType=RGBAlpha, compressionMethod=deflate, filterMethod=adaptive, interlaceMethod=none",
        "UnknownChunks UnknownChunk" => ["eXIf", "iDOT"],
        "X-TIKA:embedded_resource_path" => "/image1.png",
        "embeddedRelationshipId" => "rId4",
        "tiff:ImageWidth" => "1742",
        "Compression CompressionTypeName" => "deflate",
        "height" => "1304",
        "Chroma ColorSpaceType" => "RGB",
        "Dimension ImageOrientation" => "Normal",
        "Dimension VerticalPixelSize" => "0.17639795",
        "iCCP" => "profileName=ICC Profile, compressionMethod=deflate",
        "imagereader:NumImages" => "1",
        "Data PlanarConfiguration" => "PixelInterleaved",
        "X-TIKA:embedded_id_path" => "/1",
        "iTXt iTXtEntry" =>
          "keyword=XML:com.adobe.xmp, compressionFlag=false, compressionMethod=0, languageTag=, translatedKeyword=, text=<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 6.0.0\">\n   <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n      <rdf:Description rdf:about=\"\"\n            xmlns:exif=\"http://ns.adobe.com/exif/1.0/\">\n         <exif:PixelYDimension>1304</exif:PixelYDimension>\n         <exif:PixelXDimension>1742</exif:PixelXDimension>\n         <exif:UserComment>Screenshot</exif:UserComment>\n      </rdf:Description>\n   </rdf:RDF>\n</x:xmpmeta>"
      }
    ] = response.body
  end

  test "get_html_content(.docx)" do
    bytes = File.read!("test/fixtures/story.docx")
    {:ok, response} = TikaServerEx.RMeta.get_html_content(@tika_server, bytes)
    assert response.status == 200

    [
      %{
        "Content-Length" => "4445312",
        "Content-Type" =>
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        "X-TIKA:Parsed-By" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.microsoft.ooxml.OOXMLParser"
        ],
        "X-TIKA:Parsed-By-Full-Set" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.microsoft.ooxml.OOXMLParser",
          "org.apache.tika.parser.image.ImageParser"
        ],
        "X-TIKA:content" =>
          "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n<meta name=\"X-TIKA:Parsed-By\" content=\"org.apache.tika.parser.DefaultParser\">\n<meta name=\"X-TIKA:Parsed-By\" content=\"org.apache.tika.parser.microsoft.ooxml.OOXMLParser\">\n<meta name=\"extended-properties:DocSecurityString\" content=\"None\">\n<meta name=\"Content-Length\" content=\"4445312\">\n<meta name=\"Content-Type\" content=\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\">\n<title></title>\n</head>\n<body><p></p>\n<p>Once upon a time, in a small village nestled in the mountains, there lived a young</p>\n<p>girl named Lily. She was known throughout the village for her kind heart and</p>\n<p>adventurous spirit. One day, while exploring the forest, she stumbled upon a</p>\n<p>hidden cave and inside, she found a magical amulet that granted her the power to</p>\n<p>talk to animals.</p>\n<p></p>\n<p>Lily was born on November 22, 1990.<img src=\"embedded:image1.png\" alt=\"CleanShot 2025-01-03 at 14.09.57@2x.png\"></p>\n<p></p>\n<p>Excited by her newfound ability, Lily spent her days conversing with the creatures</p>\n<p>of the forest and helping them with their problems. She became beloved by all the</p>\n<p>animals and soon, word of her magical powers spread throughout the village. People</p>\n<p>came from far and wide to seek her help and she became known as the protector of</p>\n<p>the forest. From that day on, Lily lived a life filled with adventure and wonder,</p>\n<p>always surrounded by the creatures she loved and protected.</p>\n<p></p>\n<div class=\"package-entry\"><h1>image1.png</h1>\n</div>\n</body></html>",
        "X-TIKA:content_handler" => "ToHTMLContentHandler",
        "X-TIKA:embedded_depth" => "0",
        "extended-properties:DocSecurityString" => "None"
      },
      %{
        "tiff:BitsPerSample" => "8 8 8 8",
        "Text TextEntry" =>
          "keyword=XML:com.adobe.xmp, value=<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 6.0.0\">\n   <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n      <rdf:Description rdf:about=\"\"\n            xmlns:exif=\"http://ns.adobe.com/exif/1.0/\">\n         <exif:PixelYDimension>1304</exif:PixelYDimension>\n         <exif:PixelXDimension>1742</exif:PixelXDimension>\n         <exif:UserComment>Screenshot</exif:UserComment>\n      </rdf:Description>\n   </rdf:RDF>\n</x:xmpmeta>, language=, compression=none",
        "Dimension PixelAspectRatio" => "1.0",
        "Compression NumProgressiveScans" => "1",
        "Dimension HorizontalPixelSize" => "0.17639795",
        "Chroma NumChannels" => "4",
        "Chroma BlackIsZero" => "true",
        "Transparency Alpha" => "nonpremultipled",
        "Data BitsPerSample" => "8 8 8 8",
        "width" => "1742",
        "X-TIKA:Parsed-By" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.image.ImageParser"
        ],
        "X-TIKA:final_embedded_resource_path" => "/image1.png",
        "Data SampleFormat" => "UnsignedIntegral",
        "resourceName" => "image1.png",
        "Content-Type" => "image/png",
        "X-TIKA:embedded_depth" => "1",
        "X-TIKA:content" =>
          "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n<meta name=\"Transparency Alpha\" content=\"nonpremultipled\">\n<meta name=\"X-TIKA:embedded_id_path\" content=\"/1\">\n<meta name=\"tiff:ImageLength\" content=\"1304\">\n<meta name=\"Compression CompressionTypeName\" content=\"deflate\">\n<meta name=\"Data BitsPerSample\" content=\"8 8 8 8\">\n<meta name=\"Data PlanarConfiguration\" content=\"PixelInterleaved\">\n<meta name=\"Dimension VerticalPixelSize\" content=\"0.17639795\">\n<meta name=\"IHDR\" content=\"width=1742, height=1304, bitDepth=8, colorType=RGBAlpha, compressionMethod=deflate, filterMethod=adaptive, interlaceMethod=none\">\n<meta name=\"embeddedRelationshipId\" content=\"rId4\">\n<meta name=\"embeddedResourceType\" content=\"INLINE\">\n<meta name=\"iCCP\" content=\"profileName=ICC Profile, compressionMethod=deflate\">\n<meta name=\"Chroma ColorSpaceType\" content=\"RGB\">\n<meta name=\"tiff:BitsPerSample\" content=\"8 8 8 8\">\n<meta name=\"X-TIKA:embedded_id\" content=\"1\">\n<meta name=\"Content-Type\" content=\"image/png\">\n<meta name=\"height\" content=\"1304\">\n<meta name=\"imagereader:NumImages\" content=\"1\">\n<meta name=\"pHYs\" content=\"pixelsPerUnitXAxis=5669, pixelsPerUnitYAxis=5669, unitSpecifier=meter\">\n<meta name=\"Text TextEntry\" content=\"keyword=XML:com.adobe.xmp, value=&lt;x:xmpmeta xmlns:x=&quot;adobe:ns:meta/&quot; x:xmptk=&quot;XMP Core 6.0.0&quot;&gt;\n   &lt;rdf:RDF xmlns:rdf=&quot;http://www.w3.org/1999/02/22-rdf-syntax-ns#&quot;&gt;\n      &lt;rdf:Description rdf:about=&quot;&quot;\n            xmlns:exif=&quot;http://ns.adobe.com/exif/1.0/&quot;&gt;\n         &lt;exif:PixelYDimension&gt;1304&lt;/exif:PixelYDimension&gt;\n         &lt;exif:PixelXDimension&gt;1742&lt;/exif:PixelXDimension&gt;\n         &lt;exif:UserComment&gt;Screenshot&lt;/exif:UserComment&gt;\n      &lt;/rdf:Description&gt;\n   &lt;/rdf:RDF&gt;\n&lt;/x:xmpmeta&gt;, language=, compression=none\">\n<meta name=\"Dimension PixelAspectRatio\" content=\"1.0\">\n<meta name=\"resourceName\" content=\"image1.png\">\n<meta name=\"UnknownChunks UnknownChunk\" content=\"eXIf\">\n<meta name=\"UnknownChunks UnknownChunk\" content=\"iDOT\">\n<meta name=\"iTXt iTXtEntry\" content=\"keyword=XML:com.adobe.xmp, compressionFlag=false, compressionMethod=0, languageTag=, translatedKeyword=, text=&lt;x:xmpmeta xmlns:x=&quot;adobe:ns:meta/&quot; x:xmptk=&quot;XMP Core 6.0.0&quot;&gt;\n   &lt;rdf:RDF xmlns:rdf=&quot;http://www.w3.org/1999/02/22-rdf-syntax-ns#&quot;&gt;\n      &lt;rdf:Description rdf:about=&quot;&quot;\n            xmlns:exif=&quot;http://ns.adobe.com/exif/1.0/&quot;&gt;\n         &lt;exif:PixelYDimension&gt;1304&lt;/exif:PixelYDimension&gt;\n         &lt;exif:PixelXDimension&gt;1742&lt;/exif:PixelXDimension&gt;\n         &lt;exif:UserComment&gt;Screenshot&lt;/exif:UserComment&gt;\n      &lt;/rdf:Description&gt;\n   &lt;/rdf:RDF&gt;\n&lt;/x:xmpmeta&gt;\">\n<meta name=\"Compression NumProgressiveScans\" content=\"1\">\n<meta name=\"X-TIKA:Parsed-By\" content=\"org.apache.tika.parser.DefaultParser\">\n<meta name=\"X-TIKA:Parsed-By\" content=\"org.apache.tika.parser.image.ImageParser\">\n<meta name=\"Dimension HorizontalPixelSize\" content=\"0.17639795\">\n<meta name=\"Chroma BlackIsZero\" content=\"true\">\n<meta name=\"Compression Lossless\" content=\"true\">\n<meta name=\"X-TIKA:embedded_depth\" content=\"1\">\n<meta name=\"width\" content=\"1742\">\n<meta name=\"Dimension ImageOrientation\" content=\"Normal\">\n<meta name=\"X-TIKA:embedded_resource_path\" content=\"/image1.png\">\n<meta name=\"tiff:ImageWidth\" content=\"1742\">\n<meta name=\"Chroma NumChannels\" content=\"4\">\n<meta name=\"Data SampleFormat\" content=\"UnsignedIntegral\">\n<title></title>\n</head>\n<body></body></html>",
        "X-TIKA:content_handler" => "ToHTMLContentHandler",
        "Compression Lossless" => "true",
        "pHYs" => "pixelsPerUnitXAxis=5669, pixelsPerUnitYAxis=5669, unitSpecifier=meter",
        "X-TIKA:embedded_id" => "1",
        "tiff:ImageLength" => "1304",
        "embeddedResourceType" => "INLINE",
        "IHDR" =>
          "width=1742, height=1304, bitDepth=8, colorType=RGBAlpha, compressionMethod=deflate, filterMethod=adaptive, interlaceMethod=none",
        "UnknownChunks UnknownChunk" => ["eXIf", "iDOT"],
        "X-TIKA:embedded_resource_path" => "/image1.png",
        "embeddedRelationshipId" => "rId4",
        "tiff:ImageWidth" => "1742",
        "Compression CompressionTypeName" => "deflate",
        "height" => "1304",
        "Chroma ColorSpaceType" => "RGB",
        "Dimension ImageOrientation" => "Normal",
        "Dimension VerticalPixelSize" => "0.17639795",
        "iCCP" => "profileName=ICC Profile, compressionMethod=deflate",
        "imagereader:NumImages" => "1",
        "Data PlanarConfiguration" => "PixelInterleaved",
        "X-TIKA:embedded_id_path" => "/1",
        "iTXt iTXtEntry" =>
          "keyword=XML:com.adobe.xmp, compressionFlag=false, compressionMethod=0, languageTag=, translatedKeyword=, text=<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 6.0.0\">\n   <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n      <rdf:Description rdf:about=\"\"\n            xmlns:exif=\"http://ns.adobe.com/exif/1.0/\">\n         <exif:PixelYDimension>1304</exif:PixelYDimension>\n         <exif:PixelXDimension>1742</exif:PixelXDimension>\n         <exif:UserComment>Screenshot</exif:UserComment>\n      </rdf:Description>\n   </rdf:RDF>\n</x:xmpmeta>"
      }
    ] = response.body
  end

  test "get_metadata_only(.docx)" do
    bytes = File.read!("test/fixtures/story.docx")
    {:ok, response} = TikaServerEx.RMeta.get_metadata_only(@tika_server, bytes)
    assert response.status == 200

    [
      %{
        "Content-Length" => "4445312",
        "Content-Type" =>
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        "X-TIKA:Parsed-By" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.microsoft.ooxml.OOXMLParser"
        ],
        "X-TIKA:Parsed-By-Full-Set" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.microsoft.ooxml.OOXMLParser",
          "org.apache.tika.parser.image.ImageParser"
        ],
        "X-TIKA:embedded_depth" => "0",
        "extended-properties:DocSecurityString" => "None"
      },
      %{
        "tiff:BitsPerSample" => "8 8 8 8",
        "Text TextEntry" =>
          "keyword=XML:com.adobe.xmp, value=<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 6.0.0\">\n   <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n      <rdf:Description rdf:about=\"\"\n            xmlns:exif=\"http://ns.adobe.com/exif/1.0/\">\n         <exif:PixelYDimension>1304</exif:PixelYDimension>\n         <exif:PixelXDimension>1742</exif:PixelXDimension>\n         <exif:UserComment>Screenshot</exif:UserComment>\n      </rdf:Description>\n   </rdf:RDF>\n</x:xmpmeta>, language=, compression=none",
        "Dimension PixelAspectRatio" => "1.0",
        "Compression NumProgressiveScans" => "1",
        "Dimension HorizontalPixelSize" => "0.17639795",
        "Chroma NumChannels" => "4",
        "Chroma BlackIsZero" => "true",
        "Transparency Alpha" => "nonpremultipled",
        "Data BitsPerSample" => "8 8 8 8",
        "width" => "1742",
        "X-TIKA:Parsed-By" => [
          "org.apache.tika.parser.DefaultParser",
          "org.apache.tika.parser.image.ImageParser"
        ],
        "X-TIKA:final_embedded_resource_path" => "/image1.png",
        "Data SampleFormat" => "UnsignedIntegral",
        "resourceName" => "image1.png",
        "Content-Type" => "image/png",
        "X-TIKA:embedded_depth" => "1",
        "Compression Lossless" => "true",
        "pHYs" => "pixelsPerUnitXAxis=5669, pixelsPerUnitYAxis=5669, unitSpecifier=meter",
        "X-TIKA:embedded_id" => "1",
        "tiff:ImageLength" => "1304",
        "embeddedResourceType" => "INLINE",
        "IHDR" =>
          "width=1742, height=1304, bitDepth=8, colorType=RGBAlpha, compressionMethod=deflate, filterMethod=adaptive, interlaceMethod=none",
        "UnknownChunks UnknownChunk" => ["eXIf", "iDOT"],
        "X-TIKA:embedded_resource_path" => "/image1.png",
        "embeddedRelationshipId" => "rId4",
        "tiff:ImageWidth" => "1742",
        "Compression CompressionTypeName" => "deflate",
        "height" => "1304",
        "Chroma ColorSpaceType" => "RGB",
        "Dimension ImageOrientation" => "Normal",
        "Dimension VerticalPixelSize" => "0.17639795",
        "iCCP" => "profileName=ICC Profile, compressionMethod=deflate",
        "imagereader:NumImages" => "1",
        "Data PlanarConfiguration" => "PixelInterleaved",
        "X-TIKA:embedded_id_path" => "/1",
        "iTXt iTXtEntry" =>
          "keyword=XML:com.adobe.xmp, compressionFlag=false, compressionMethod=0, languageTag=, translatedKeyword=, text=<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 6.0.0\">\n   <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n      <rdf:Description rdf:about=\"\"\n            xmlns:exif=\"http://ns.adobe.com/exif/1.0/\">\n         <exif:PixelYDimension>1304</exif:PixelYDimension>\n         <exif:PixelXDimension>1742</exif:PixelXDimension>\n         <exif:UserComment>Screenshot</exif:UserComment>\n      </rdf:Description>\n   </rdf:RDF>\n</x:xmpmeta>"
      }
    ] = response.body
  end
end

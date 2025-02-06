defmodule TikaServerExTest do
  use ExUnit.Case

  @tika_server TikaServerEx.new("http://localhost:9998")

  test "extracts text from a .docx file" do
    bytes = File.read!("test/fixtures/story.docx")
    {:ok, response} = TikaServerEx.new("http://localhost:9998") |> TikaServerEx.Tika.get_text(bytes)
    assert response.status == 200
    assert response.body =~ "\nOnce upon a time"
  end

  test "extracts json from a .docx file" do
    bytes = File.read!("test/fixtures/story.docx")
    {:ok, response} = TikaServerEx.Tika.get_json(@tika_server, bytes)
    assert response.status == 200

    assert response.body == %{
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
             "extended-properties:DocSecurityString" => "None"
           }
  end

  test "extract text from an html file" do
    bytes = File.read!("test/fixtures/Tapioca DAO stops 1,000 ETH worth $2.7 million from being stolen following exploit that drains majority of its funds.html")
    {:ok, response} = TikaServerEx.Tika.get_text(@tika_server, bytes)
    assert response.status == 200
    assert response.body =~ "\n   \n  \n    www.theblock.co\n    /post/322061/tapioca-dao-stops-1000-eth-worth-2-7-million-from-being-stolen-following-exploit-that-drains-majority-of-its-funds\n  \n  Tapioca DAO stops 1,000 ETH worth $2.7 million"
  end
end

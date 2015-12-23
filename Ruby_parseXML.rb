# 解析XML文件  
  
require "rexml/document"  
include REXML  
puts "-- BEGIN --"  
doc = Document.new(File.open("TestXML.xml"))  
#doc.elements.each('BoardComposant') do |elem|  
#  cr_ele = elem.get_elements('ComponantRectangle')  
#  puts cr_ele  
#end  
doc.elements.each("BoardComposant/ComponantRectangle"){  |elem|  
  if "second" == elem.attributes["name"]  then  
    puts " => 2th"  
    puts elem.elements[2].elements["Height"].text  
    elem.elements.each{ |e|  
      puts e.elements["Height"].text    
    }  
  end  
}  
#----------------------------------------------  
puts "-----------------------------------------"  
#----------------------------------------------  
input = File.new("book.xml")  
doc = Document.new(input)  
  
root = doc.root  
puts root.attributes["shelf"]          #　Recent　Acquisitions　  
  
doc.elements.each("library/section") { |e| puts e.attributes["name"] }  
#  Output:　  
#    Ruby　  
#    Space　  
  
doc.elements.each("*/section/book") { |e| puts e.attributes["isbn"] }  
#　Output:　  
#　　0672328844　  
#　　0321445619　  
#　　0684835509　  
#　　074325631X　  
  
sec2 = root.elements[2]  
author = sec2.elements[1].elements["author"].text         #　Robert　Zubrin  
puts author  
puts "-- End --"  


=begin
ook.xml

[xhtml] view plaincopy
<library shelf="Recent Acquisitions">   
<section name="Ruby">   
<book isbn="0672328844">   
<title>The Ruby Way</title>   
<author>Hal Fulton</author>   
<description>   
Second edition. The book you are now reading.   
Ain't recursion grand?   
</description>   
</book>   
</section>   
<section name="Space">   
<book isbn="0684835509">   
<title>The Case for Mars</title>   
<author>Robert Zubrin</author>   
<description>Pushing toward a second home for the human   
race.   
</description>   
</book>   
<book isbn="074325631X">   
<title>First Man: The Life of Neil A. Armstrong</title>   
<author>James R. Hansen</author>   
<description>Definitive biography of the first man on   
the moon. </description>   
</book>   
</section>   
</library>  
 

TestXML.xml

[xhtml] view plaincopy
<?xml version="1.0" encoding="utf-8"?>  
<BoardComposant>  
  <ComponantRectangle name="first" X="97" Y="186" Height="382" Width="587" >  
    <JoinSpot>  
      <Position>  
        <X>147</X>  
        <Y>219</Y>  
      </Position>  
      <Height>76</Height>  
      <Width>86</Width>  
    </JoinSpot>  
    <JoinSpot>  
      <Position>  
        <X>510</X>  
        <Y>236</Y>  
      </Position>  
      <Height>65</Height>  
      <Width>77</Width>  
    </JoinSpot>  
    <JoinSpot>  
      <Position>  
        <X>194</X>  
        <Y>380</Y>  
      </Position>  
      <Height>108</Height>  
      <Width>83</Width>  
    </JoinSpot>  
    <JoinSpot>  
      <Position>  
        <X>417</X>  
        <Y>400</Y>  
      </Position>  
      <Height>85</Height>  
      <Width>167</Width>  
    </JoinSpot>  
  </ComponantRectangle>  
    
  <ComponantRectangle name="second" X="733" Y="179" Height="410" Width="343">  
    <JoinSpot>  
      <Position>  
        <X>770</X>  
        <Y>221</Y>  
      </Position>  
      <Height>78</Height>  
      <Width>70</Width>  
    </JoinSpot>  
    <JoinSpot>  
      <Position>  
        <X>916</X>  
        <Y>259</Y>  
      </Position>  
      <Height>68</Height>  
      <Width>92</Width>  
    </JoinSpot>  
    <JoinSpot>  
      <Position>  
        <X>839</X>  
        <Y>416</Y>  
      </Position>  
      <Height>109</Height>  
      <Width>62</Width>  
    </JoinSpot>  
    <JoinSpot>  
      <Position>  
        <X>953</X>  
        <Y>410</Y>  
      </Position>  
      <Height>85</Height>  
      <Width>63</Width>  
    </JoinSpot>  
  </ComponantRectangle>  
    
  <ComponantRectangle name="third" X="126" Y="624" Height="282" Width="471">  
    <JoinSpot>  
      <Position>  
        <X>179</X>  
        <Y>658</Y>  
      </Position>  
      <Height>108</Height>  
      <Width>133</Width>  
    </JoinSpot>  
  </ComponantRectangle>  
    
  <ComponantRectangle name="forth" X="333" Y="122" Height="282" Width="471" />  
</BoardComposant>  
=end

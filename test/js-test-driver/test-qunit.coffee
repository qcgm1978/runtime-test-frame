'use strict'
#Top 10 Questions for Java Regular Expression implemented by coffeescript
#original link:http://www.programcreek.com/2013/10/top-10-questions-for-java-regular-expression/
#1. How to extract numbers from a string?
numStr='a1b2c3d4e|55'
arr1=numStr.match ///
\d+ #prehaps multi-digits
///g
#2. How to split Java String by newlines?
multiLinesStr="""
first line

second line\r\n\n\r


third line\r
	a
"""
arr2=multiLinesStr.match ///
.+      # Find a single character, except newline or line terminator including \r, \n, \r\n
///g
# 3, create a instance of Regex object
reg3=new RegExp('\\d+','g')
# 4. How to escape text for regular expression? literal assignments has effect in js
reg4=///\d+///g
# 5.String.split() needn't pipe delimiter to be escaped in js
arr5=numStr.split(///3|4///)
# 6. How can we match anbn with Java regex?
str6='aabb'
reg6=///^a+b+$///
str6_1=str6.match(/a+/)
str6_2=str6.match(/b+/)
test( "qunit test", ->
		equal [],[],'equal in qunit is contents equal test'
)
test('reqular expression',->
	equal arr1,[1,2,3,4,55]
	equal arr2,['first line','second line','third line','	a']
	ok reg3.global is reg4.global and reg3.source is reg4.source, 'js can create the instance of RegExp object by two ways'
	equal arr5, ['a1b2c','d','e|55']
	ok reg6.exec str6
	equal str6_1, ['aa']
	equal str6_2,['bb']
	ok str6_1[0].length is str6_2[0].length

)
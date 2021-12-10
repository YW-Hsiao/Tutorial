## 4. Test Markdown Commands
### 4-1. Typesetting
1. First way  
abc  
123
```
abc
```
    123
    ```
    xyz
    ```
2. Second way  
abc
123
    ```
    xyz
    ```
    ijk


### 4-2. Hyperlink
* [Tutorial README](https://github.com/guodongxiaren/README#%E6%A8%AA%E7%BA%BF)  
* [Unicode Character Table](https://unicode-table.com/en/)  
* [![Unicode](https://home.unicode.org/wp-content/uploads/2019/12/Unicode-Logo-Final-Blue-95x112.jpg)](https://home.unicode.org/)  
* [Shields](https://shields.io/)
    * ![Shields IO](https://img.shields.io/badge/Shields-IO-red)
    * [![Shields IO](https://img.shields.io/badge/Shields-IO-red)](https://shields.io/)  
    * ![YW-Hsiao/SVJ-ATLAS](https://img.shields.io/coveralls/github/YW-Hsiao/SVJ-ATLAS?style=plastic)  
    * [![YW-Hsiao/SVJ-ATLAS](https://img.shields.io/badge/YW--Hsiao-SVJ--ATLAS-blue)](https://github.com/YW-Hsiao/SVJ-ATLAS)

Another examples:
[![Build Status](http://img.shields.io/travis/clips/pattern/master.svg?style=flat)](https://travis-ci.org/clips/pattern/branches)
[![Coverage](https://img.shields.io/coveralls/clips/pattern/master.svg?style=flat)](https://coveralls.io/github/clips/pattern?branch=master)
[![PyPi version](http://img.shields.io/pypi/v/pattern.svg?style=flat)](https://pypi.python.org/pypi/pattern)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-green.svg?style=flat)](https://github.com/clips/pattern/blob/master/LICENSE.txt)


### 4-3. Table
1. [Fooish HTML table](https://www.fooish.com/html/table.html)  
2. [HTML 表格的基礎](https://developer.mozilla.org/zh-TW/docs/Learn/HTML/Tables/Basics)  
3. [MDN Web Docs table](https://developer.mozilla.org/zh-TW/docs/Web/HTML/Element/table)  
4. [Wibibi HTML table](https://www.wibibi.com/info.php?tid=116)  
5. [Wibibi HTML font](https://www.wibibi.com/info.php?tid=397)

<table>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
    </tr>
    <tr>
        <td>5</td>
        <td rowspan="0">6</td>
        <td>7</td>
        <td>8</td>
    </tr>
    <tr>
        <td>9</td>
        <td>11</td>
        <td>12</td>
    </tr>
    <tr>
        <td>13</td>
        <td>15</td>
        <td>16</td>
    </tr>
</table>


### 4-4. Color
1. First way
```diff
- text in red
+ text in green
! text in orange
# text in gray
```
```diff
- abc
+ 123
! xyz
@@ text in purple and bold @@
```
```diff
abc
```
`- abc`  
`+ 123`  
`! xyz`  
2. Second way  
![#FF0000](https://placehold.it/15/FF0000/000000?text=+)`abc`  
![#FF0000](https://placehold.it/15/FF0000/000000?text=+)`abc`

3. Third way
```js
abc
123
xyz
```
```ruby
abc
123
xyz {ijk}
```
<span style="color: green"> Some green text </span>  


4. Fourth way
```
<div class="text-purple">
    This text is purple, <a href="#" class="text-inherit">including the link</a>
</div>
```

<div class="text-purple">
    This text is purple, <a href="#" class="text-inherit">including the link</a>
</div>  
<div class="text-purple">
  This text is purple, <a href="#" class="text-inherit">including the link</a>
</div>  






<div class="text-blue mb-2">
  .text-blue on white
</div>  
`<div class="text-blue mb-2">
  .text-blue on white
</div>`
```
<div class="text-blue mb-2">
  .text-blue on white
</div>
```


### 4-5. Pattern
[![Unicode](https://home.unicode.org/wp-content/uploads/2019/12/Unicode-Logo-Final-Blue-95x112.jpg)](https://home.unicode.org/)  
[Unicode Character Table](https://unicode-table.com/en/)  
The Unicode number:  
U+1F53A  
\1F53A  
&#128314;
&#128315;
&#10071;
&#8252;  
I use &#10071;&#128314; sentence &#128315; as NOTICE.



# Conventions and Rules

## Naming Convention
In order to have the same code, and not have parts of the code using different conventions, we've put in place a few rules.

> Folder

For any folder or subfolder, the folder name is written in snake case (i.e. each word is written in lower case, and separated by an underscore). Here are a few examples:<br>
`my_wonderful_document`
`technical_specifications`
`document`
<br><br>

> File

For all files created, we'll use the flat case style (i.e. all words are pasted in, and written in lower case). Here are a few examples:<br>
`mywonderfulfile.dart`
`wonderfulfunctionality.dart`
`myusermanual.md`
<br><br>

> Variable

For all variables in the code, they must use the camel snake case naming convention (i.e. all words are separated by an underscore, the first word is always lowercase, and subsequent words always start with a capital letter). All variable names will be self-explanatory. Here are a few examples:<br>
`user_Name`
`ui_Design_Color_Setting`
`register_Button_Color`
<br><br>

> Function/Widget

For functions and widget names, the naming convention used is camel case (i.e. all words are glued together, the first word is in lower case and subsequent words are capitalized). All function and widget names must be self-explanatory. Here are a few examples: <br>
`searchForUserInDatabase`
`userSlideOnLeft`
`changeApplicationLanguage`

> GitHub branch

For GitHub branches, we'll use the flat case style (i.e. all words are pasted in, and written in lower case). Here are a few examples:<br>
`main`
`dev`
`branch`
<br><br>

## Rules

> Comments

Each function must be detailed with comments and the name of the function's author.
Here's an example of what it looks like:

```dart
// Function made by DELILLE Elone and GUILLOUCHE Enzo

/* 
This function is used to change the application background color
@function changeBackgroundColor
@parameter newColor

changeBackgroundColor is called when we want to change the background color of the application. When we call it, we have to put a color as an argument. The color has to be a String.
*/

void changeBackgroundColor(String newColor){
    user.setting.backgroundColor = newColor;
}

// End of the function
```

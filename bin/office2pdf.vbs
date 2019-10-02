Option Explicit


Sub WriteLine ( strLine )
	WScript.Stdout.WriteLine strLine
End Sub

' http://msdn.microsoft.com/en-us/library/office/aa432714(v=office.12).aspx
Const msoFalse = 0 ' False.
Const msoTrue = -1 ' True.

' http://msdn.microsoft.com/en-us/library/office/bb265636(v=office.12).aspx
Const ppFixedFormatIntentScreen = 1 ' Intent is to view exported file on screen.
Const ppFixedFormatIntentPrint = 2 ' Intent is to print exported file.

' http://msdn.microsoft.com/en-us/library/office/ff746754.aspx
Const ppFixedFormatTypeXPS = 1 ' XPS format
Const ppFixedFormatTypePDF = 17 ' PDF format

' http://msdn.microsoft.com/en-us/library/office/ff744564.aspx
Const ppPrintHandoutVerticalFirst = 1 ' Slides are ordered vertically, with the first slide in the upper-left corner and the second slide below it.
Const ppPrintHandoutHorizontalFirst = 2 ' Slides are ordered horizontally, with the first slide in the upper-left corner and the second slide to the right of it.

' http://msdn.microsoft.com/en-us/library/office/ff744185.aspx
Const ppPrintOutputSlides = 1 ' Slides
Const ppPrintOutputTwoSlideHandouts = 2 ' Two Slide Handouts
Const ppPrintOutputThreeSlideHandouts = 3 ' Three Slide Handouts
Const ppPrintOutputSixSlideHandouts = 4 ' Six Slide Handouts
Const ppPrintOutputNotesPages = 5 ' Notes Pages
Const ppPrintOutputOutline = 6 ' Outline
Const ppPrintOutputBuildSlides = 7 ' Build Slides
Const ppPrintOutputFourSlideHandouts = 8 ' Four Slide Handouts
Const ppPrintOutputNineSlideHandouts = 9 ' Nine Slide Handouts
Const ppPrintOutputOneSlideHandouts = 10 ' Single Slide Handouts

' http://msdn.microsoft.com/en-us/library/office/ff745585.aspx
Const ppPrintAll = 1 ' Print all slides in the presentation.
Const ppPrintSelection = 2 ' Print a selection of slides.
Const ppPrintCurrent = 3 ' Print the current slide from the presentation.
Const ppPrintSlideRange = 4 ' Print a range of slides.
Const ppPrintNamedSlideShow = 5 ' Print a named slideshow.

' http://msdn.microsoft.com/en-us/library/office/ff744228.aspx
Const ppShowAll = 1 ' Show all.
Const ppShowNamedSlideShow = 3 ' Show named slideshow.
Const ppShowSlideRange = 2 ' Show slide range.

'
' This is the actual script
'

Dim inputFile
Dim outputFile
Dim wordApplication
Dim powerpointApplication
Dim document
Dim fileSystemObject
Dim presentation
Dim objPrintOptions

If WScript.Arguments.Count <> 2 Then
	WriteLine "You need to specify input and output files."
	WScript.Quit 1
End If

inputFile = WScript.Arguments(0)
outputFile = WScript.Arguments(1)

Set fileSystemObject = CreateObject("Scripting.FileSystemObject")

If Not fileSystemObject.FileExists( inputFile ) Then
	WriteLine "Unable to find your input file " & inputFile
	WScript.Quit 1
End If

If fileSystemObject.FileExists( outputFile ) Then
	WriteLine "Your output file (' & outputFile & ') already exists!"
	WScript.Quit 1
End If

WriteLine "Input File:	" & inputFile
WriteLine "Output File: " & outputFile

inputFile = fileSystemObject.GetAbsolutePathName(inputFile)
outputFile = fileSystemObject.GetAbsolutePathName(outputFile)

Select Case fileSystemObject.GetExtensionName(inputFile)
	Case "docx", "doc"

		Set wordApplication = CreateObject("Word.Application")
		wordApplication.Visible = True
		wordApplication.Documents.Open inputFile

		Set document = wordApplication.ActiveDocument

		' Reference for this at http://msdn.microsoft.com/en-us/library/office/ff746080.aspx
		document.ExportAsFixedFormat outputFile, ppFixedFormatTypePDF', ppFixedFormatIntentScreen, msoTrue, ppPrintHandoutHorizontalFirst, ppPrintOutputSlides, msoFalse, objPrintOptions.Ranges(1), ppPrintAll, "Slideshow Name", False, False, False, False, False

		document.Close
		wordApplication.Quit

	Case "pptx", "ppt"

		Set powerpointApplication = CreateObject("PowerPoint.Application")

		powerpointApplication.Visible = True
		powerpointApplication.Presentations.Open inputFile

		Set presentation = powerpointApplication.ActivePresentation
		Set objPrintOptions = presentation.PrintOptions

		objPrintOptions.Ranges.Add presentation.Slides(1).SlideNumber,(presentation.Slides.Count+presentation.Slides(1).SlideNumber-1)
		objPrintOptions.RangeType = ppShowAll

		' Reference for this at http://msdn.microsoft.com/en-us/library/office/ff746080.aspx
		presentation.ExportAsFixedFormat outputFile, ppFixedFormatTypePDF, ppFixedFormatIntentScreen, msoTrue, ppPrintHandoutHorizontalFirst, ppPrintOutputSlides, msoFalse, objPrintOptions.Ranges(1), ppPrintAll, "Slideshow Name", False, False, False, False, False

		presentation.Close
		powerpointApplication.Quit

End Select

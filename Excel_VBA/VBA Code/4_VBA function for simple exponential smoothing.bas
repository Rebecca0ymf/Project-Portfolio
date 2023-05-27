Attribute VB_Name = "Modul1"
't means timeserise
'Y is the data used for prediction
'L is a simple exponential smoothing function

Function Y(t As Integer) As Double
 Y = Range("B" & t + 1).Value
'when t=1, Y = B2
't means time series (like 1,2,3...)
'Y is the number of columns B and starting at B2 is the predictive data
'This function defines the relationship between t and Y
End Function

Function L(t As Integer, alpha As Double, L1 As Double) As Double
'Lt = alpha * Yt +(1-alpha)* Lt-1
   If (t = 1) Then
      L = L1
   Else
      L = alpha * Y(t) + (1 - alpha) * L(t - 1, alpha, L1)

    End If

End Function

Sub Expsmoothing()

Dim L1 As Double
Dim t As Integer
Dim alpha As Double
'Lt = alpha * Yt +(1-alpha)* Lt-1
'Ft+1 = alpha*Yt + (1-alpha)*Ft
'Ft+1 = Ft + alpha(Yt - Ft)
' Ft+1 = Lt
' L1 = Y1 = Lt-1 + alpha(Yt - Lt-1)


alpha = Application.InputBox("alpha")
' put alpha value into
'time(t) and Data(y) is a function
L1 = Range("B2").Value

For i = 3 To 12
' For i = 3 To the row number of the data column + 1


Range("E" & i).Value = L(i - 2, alpha, L1)

Next

End Sub


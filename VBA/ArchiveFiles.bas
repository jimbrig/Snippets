' Sub Routine
' ArchiveFolder
'
' DESCRIPTION:
' Archives all the files in the source folder into an archive folder
' inside the existing folder.
'
' REFERENCES:
' Reference Library -> Microsoft Runtime Scripting
'
' INPUTS:
' stringSourceFolderPath
'   Type: string
'   Desc: string which is the file path of the folder
'
' NOTES:
' The archive file is hard coded to be inside the source folder.
'
' RETURNS:
' Nothing
Sub ArchiveFolder(FolderPath As String)

  Dim ArchivePath As String
  Dim FileExt As String
  Dim ArchivePathGood As Boolean
  Dim FSO As New FileSystemObject
  Dim FSOArchiveFolder As Folder
  Dim FSOFolder As Folder

  ArchivePath = FolderPath & "\Archive\"
  FileExt = "*.*"
  ArchivePathGood = FSO.FolderExists(ArchivePath)

  If ArchivePathGood = False Then
      Set FSOArchiveFolder = FSO.CreateFolder(ArchivePath)
  Else
      Set FSOArchiveFolder = FSO.GetFolder(ArchivePath)
  End If

  Set FSOFolder = FSO.GetFolder(FolderPath & Application.PathSeparator)

  If FSOFolder.Files.Count > 0 Then
      FSO.MoveFile Source:=FSOFolder.Path & Application.PathSeparator & FileExt, _
        Destination:=FSOArchiveFolder.Path & Application.PathSeparator
  End If

  Set FSO = Nothing
  Set FSOArchiveFolder = Nothing
  Set FSOFolder = Nothing

End Sub

let ExcelTrim = (TextToTrim) =>
    let
        ReplacedText = Text.Replace(TextToTrim, "  ", " "),
        Result = if not(Text.Contains(ReplacedText, "  "))
            then ReplacedText
                else @ExcelTrim(ReplacedText)
    in
        Text.Trim(Result)
in
    ExcelTrim
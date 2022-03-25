= Table.SelectRows(#"Source", each [DATECOLUMNTOFILTER] >= DateTime.Date(DateTime.LocalNow()))

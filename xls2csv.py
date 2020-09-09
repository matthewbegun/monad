import csv
import sys
import xlrd
from pathlib import Path


def xls2csv(workbook_path, output_base_path):
    """
    Generates a csv file for each sheet of the given excel file.
    Naming convention is `workbook-worksheet.csv`.

    Parameters
    ----------
    workbook_path : str
        path of workbook file
    output_base_path : str
        path of output directory
    """

    with xlrd.open_workbook(workbook_path) as wb:
        for sheet_name in wb.sheet_names():
            sh = wb.sheet_by_name(sheet_name)
            output_file = output_base_path / (
                workbook_path.stem + "-" + sheet_name + ".csv"
            )
            with open(output_file, "w", newline="") as f:
                col = csv.writer(f)
                for row in range(sh.nrows):
                    col.writerow(sh.row_values(row))


if __name__ == "__main__":
    xls2csv(workbook_path=Path(sys.argv[1]), output_base_path=Path(sys.argv[2]))

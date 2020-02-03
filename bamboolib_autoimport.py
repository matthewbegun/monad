
# HOW TO DEACTIVATE AUTO-IMPORT:
# if you dont want to auto-import bamboolib, you have two options:
# 0) if you want to disable the auto-import but sometimes keep using bamboolib
#    you can uncomment the import statement below
# 1) if you never want to use bamboolib again, you can delete this file

try:
    import bamboolib as bam
    bam._enable_rich_pandas_df()
    pass
except:
    pass

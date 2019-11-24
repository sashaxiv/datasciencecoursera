#A reminder: DT[where, select|update|do, by] syntax is used to work with columns of a data.table.

#The "where" part is the i argument
#The "select|update|do" part is the j argument
#These two arguments are usually passed by position instead of by name.

#All modifications to columns can be done in j. Additionally, the set function is available for this use.

# example data
DT = as.data.table(mtcars, keep.rownames = TRUE)
app <- ShinyDriver$new("../")
app$snapshotInit("mytest")

app$setInputs(bins = 20)
app$setInputs(bins = 3)
app$setInputs(bins = 40)
app$snapshot()

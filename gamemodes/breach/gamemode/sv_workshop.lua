local tblWorkshop = {
	"862448114",
	"183901628",
	"280961678",
	"827243834",
	"268641868",
	"290599102",
	"764329142",
	"740748927",
	"636790055",
}

for i = 1, #tblWorkshop do
	print (("Added '%s' to workshop prerequisites on interface!"):format (tblWorkshop [i]))
	resource.AddWorkshop (tblWorkshop [i])
end
# Variabler og output
name="Frank"
echo "Hej, $name!"

# Funktioner
welcome() {
	echo "Velkommen $1!"
}
welcome "Frank"

# case statements
read -p "Tag et valg: " choice
case "$choice" in
	start) echo "Starter en process...";;
	stop) echo "Stopper processen...";;
	*) echo "Invalid valg";;
esac

# pipelining
# Bruges til at sende output fra én kommando direkte ind som input til en anden kommando
cat error.log | grep "error" | sort | uniq -c
# Eksemplet herover er ofte anvendt i den virkelige verden, her læses indholdet af error log
# Derefter filtreres teksten linje for linje, linjer som indeholder ordet "error" beholdes.
# Linjer som er duplikerede fjernes
# -c betyder at der samtidig tælles antal af unikke linjer som indeholder "error"

# Redirection
echo "Hello World" > output.txt # Skriver teksten til en fil kaldet output.txt, opretter filen hvis ikke den allerede findes, overskriver hvis den gør.
cat < input.txt # viser inbdholdet af input.txt

# Arithmetic operations
num1=5
num2=2
result=$((num1 + num2))
echo $result

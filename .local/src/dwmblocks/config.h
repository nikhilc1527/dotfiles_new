//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	/* {"⌨", "sb-kbselect", 0, 30}, */
  
  	{"ram: ", "free -m | grep Mem | awk '{print ($3/$2)*100}'",                     1,	16},
	{"cpu: ",	"sb-cpu",		1,	15},
  	/* {"📚", "mount_sizes",                     15,	14}, */
  	{"🌶", "sensors | /usr/bin/grep Tctl | awk '{print $2}' | cut -c 2-",                     1,	13},
  	{"", "sb-nettraf",                              1,	12},
  	/* {"🔒", "gpg-connect-agent 'keyinfo --list' /bye | /usr/bin/grep -- \"- 1\" | wc -l",	5,	11}, */
  	{"📅", "task rc.verbose=nothing ls | wc -l",	0,	10},
  	{"", "sb-weather",	180,	17},
        
  	{"🕛", "$HOME/.scripts/time_status",	1,	9},

	/* {"", "cat /tmp/recordingicon 2>/dev/null",	0,	9}, */
	/* {"",	"sb-tasks",	10,	26}, */
	/* {"",	"sb-music",	0,	11}, */
	/* {"",	"sb-pacpackages",	0,	8}, */
	/* {"",	"sb-news",		0,	6}, */
	/* {"",	"sb-price lbc \"LBRY Token\" 📚",			9000,	22}, */
	/* {"",	"sb-price bat \"Basic Attention Token\" 🦁",	9000,	20}, */
	/* {"",	"sb-price link \"Chainlink\" 🔗",			300,	25}, */
	/* {"",	"sb-price xmr \"Monero\" 🔒",			9000,	24}, */
	/* {"",	"sb-price eth Ethereum 🍸",	9000,	23}, */
	/* {"",	"sb-price btc Bitcoin 💰",				9000,	21}, */
	/* {"",	"sb-torrent",	20,	7}, */
	/* {"",	"sb-memory",	10,	14}, */
	/* {"",	"sb-moonphase",	18000,	17}, */
	/* {"",	"sb-forecast",	18000,	5}, */
	/* {"",	"sb-mailbox",	180,	12}, */
	/* {"",	"sb-nettraf",	1,	16}, */
	/* {"",	"sb-volume",	0,	10}, */
	/* {"",	"sb-battery",	5,	3}, */
	/* {"",	"sb-clock",	60,	1}, */
	/* {"",	"sb-internet",	5,	4}, */
	/* {"",	"sb-help-icon",	0,	15}, */
};

//Sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char *delim = " | ";

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:

// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
// 🤖

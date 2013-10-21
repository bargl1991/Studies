var player1 = {
	mark: 'X',
	name: 'Player 1',
	style: 'player1_cell',
	score_el: 'player1_wins',
	wins: 0
};
// The second player
var player2 = {
	mark: 'O',
	name: 'Player 2',
	style: 'player2_cell',
	score_el: 'player2_wins',
	wins: 0
};
var players = [player1, player2];
var current_player = 0;
var num_of_cols = 3;
var num_of_rows = 3;

$("#game_map").empty();
// Then for every column and row, we will...
for(var i=0; i<num_of_cols*num_of_rows;++i)
{
    // create a div to be a cell in the game map, and...
    var cell = $("<div></div>")
            .addClass("cell")
            .appendTo("#game_map");
    // add the line breaks to handle the rows
    // in a quite cross-browser way
    if ( i % num_of_cols === 0 ){
        cell.before('<div class="clear"></div>');
    }
}

$("#game_map.cell")
.bind("click", playMove)
.bind('mouseover',hoverCell)
.bind('mouseout',leaveCell);
initTurn();

function initTurn(){
    $("#player_name").text(players[current_player].name);
    $("#player_mark").text(players[current_player].mark);
};


var player1 = {
    mark: 'X',
    name: 'Player 1',
    style: 'player1_cell',
    score_el: 'player1_wins',
    wins: 0};
// The second player
var player2 = {
    mark: 'O',
    name: 'Player 2',
    style: 'player2_cell',
    score_el: 'player2_wins',
    wins: 0
};
var players = [player1, player2];
var current_player = 0;


function hoverCell(ev){
    $(this).addClass("hover");
    return false;
};
function leaveCell(ev){
    $(this).removeClass("hover");
    return false;
};
function playMove(ev){
    var cell = $(this);
    cell
        .addClass(players[current_player].style)
        .addClass("marked")
        .text(players[current_player].mark)
        .trigger("mouseout")
        .unbind("click mouseover mouseout");
    
    // Check if someone won
    if ( !checkAndProcessWin() ) {
        // Change the current player
        current_player = (++current_player) % players.length;
        initTurn(current_player);
    }
    return false;
};

$.expr[":"].mod = function(el, i, m) {
    return i % m[3] === 0
};  
$.expr[":"].sub_mod = function(el, i, m) {
    var params = m[3].split(",");
    return (i-params[0]) % params[1] === 0
};

for (var row=1; row <= num_of_rows && !win; ++row ) 
{
    cells_inspected = cells
        .filter(":lt("+num_of_cols*row+")")
        .filter(":eq("+(num_of_cols*(row-1))+"),:gt("+(num_of_cols*(row-1))+")")
        .filter("."+current_class);
    if ( cells_inspected.length == num_of_cols ) win = true;
}

for (var col=0; col <= num_of_cols && !win; ++col )
{
    cells_inspected = cells
        .filter(":sub_mod("+col+","+num_of_rows+")")
        .filter("."+current_class);
    if ( cells_inspected.length == num_of_rows ) win = true;
}

cells_inspected = cells
    .filter(":mod("+(num_of_rows+1)+")")
    .filter("."+current_class);
if ( cells_inspected.length == num_of_rows ) win = true;
else{
    // From lower right to upper left
    cells_inspected = cells
        .filter(":mod("+(num_of_rows-1)+"):not(:last,:first)")
        .filter("."+current_class);
    if ( cells_inspected.length == num_of_rows ) win = true;
}
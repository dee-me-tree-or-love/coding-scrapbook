///////////////////////////////////////////////////////////////////////////////
// Simple NIM game (misere) for 2 players.                                   //
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //
// See more at https://en.wikipedia.org/wiki/Nim.                            //
//                                                                           //
// Gameplay:                                                                 //
//  - Game starts with N rows, for each row i containing (i * 2 + 1) sticks. //
//  - Each player iteratively takes X sticks from any row i in N.            //
//  - The player who takes the last stick loses the game.                    //
///////////////////////////////////////////////////////////////////////////////

// TODO: useful for the future to support user input.
// use std::io;

struct Game {
    active: bool,
    player_1_move: bool,
    // TODO: add a type synonim for Vec<u32> representing rows?
    rows: Vec<u32>,
}

fn build_rows(nr_rows: u32) -> Vec<u32> {
    (0u32..nr_rows).map(|x| (x * 2) + 1).collect::<Vec<u32>>()
}

fn build_game(nr_rows: u32) -> Game {
    Game {
        active: true,
        player_1_move: true,
        rows: build_rows(nr_rows),
    }
}

fn print_row(row: u32) {
    println!("{}", (0..row).map(|_| "!").collect::<String>());
}

fn print_game_state(game: &Game) {
    if game.active {
        if game.player_1_move {
            print_player_greeting(1);
        } else {
            print_player_greeting(2);
        }
        for row in &game.rows {
            print_row(*row);
        }
    }
}

fn print_player_greeting(player_nr: u32) {
    println!("Your move, player {}!", player_nr);
}

// TODO: add a guard to prevent taking more than possible!
fn take_from_row(game: &mut Game, row_index: usize, amount: u32) -> Game {
    let rows = &mut game.rows;
    rows[row_index] = rows[row_index] - amount;
    Game {
        rows: rows.to_vec(),
        ..*game
    }
}

fn get_user_move() -> u32 {
    // TODO: implement a user input prompt
    return 1;
}

fn main() {
    println!("Hello, players.");

    // TODO: build game with user provided amount of rows.
    let mut game = build_game(4);

    // TODO: define this as a player step function
    for number in 1..4 {
        println!("Round: {}", number);
        print_game_state(&game);
        
        // TODO: introduce a Tuple for user input?
        let row_index = get_user_move() as usize;
        let amount = get_user_move();

        // TODO: check that row index and amount are okay.
        game = take_from_row(&mut game, row_index, amount);
        game.player_1_move = !game.player_1_move;
    }
}

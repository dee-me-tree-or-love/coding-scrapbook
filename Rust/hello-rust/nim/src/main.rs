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

use std::io;
struct Game {
    player_1_move: bool,
    // TODO: add a type synonim for Vec<u32> representing rows?
    rows: Vec<u32>,
}

impl Game {
    fn admits(&self, row: usize, amount: u32) -> bool {
        row < self.rows.len() && (self.rows[row] >= amount)
    }

    fn is_active(&self) -> bool {
        0 < self.rows.iter().fold(0, |sum, &val| sum + val)
    }
}

fn build_rows(nr_rows: u32) -> Vec<u32> {
    (0u32..nr_rows).map(|x| (x * 2) + 1).collect::<Vec<u32>>()
}

fn build_game(nr_rows: u32) -> Game {
    Game {
        player_1_move: true,
        rows: build_rows(nr_rows),
    }
}

fn print_row(row: u32, index: usize) {
    println!("{}: {}", index, (0..row).map(|_| "!").collect::<String>());
}

fn print_game_state(game: &Game) {
    if game.is_active() {
        if game.player_1_move {
            print_player_greeting(1);
        } else {
            print_player_greeting(2);
        }
        let mut index : usize = 0;
        for row in &game.rows {
            print_row(*row, index);
            index = index + 1;
        }
    }
}

fn print_player_greeting(player_nr: u32) {
    println!("~~~~\nYour move, player {}!", player_nr);
}

fn print_game_finish(game: &Game) {
    if game.player_1_move {
        print_player_farewell(1);
        print_player_congrats(2);
    } else {
        print_player_farewell(2);
        print_player_congrats(1);
    }
}

fn print_player_farewell(player_nr: u32) {
    println!("~~~~\n 😥 Your loss, player {}!", player_nr);
}

fn print_player_congrats(player_nr: u32) {
    println!("~~~~\n 🎉 Your victory, player {}!", player_nr);
}

fn take_from_row(game: &mut Game, row: usize, amount: u32) -> Game {
    let rows = &mut game.rows;
    rows[row] = rows[row] - amount;
    Game {
        rows: rows.to_vec(),
        ..*game
    }
}

fn get_user_move(prompt: String) -> u32 {
    println!(">> {}", prompt);
    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Failed to read line");
    let input: u32 = input.trim().parse().expect("Please type a number!");
    return input;
}

fn print_welcome() {
    println!("🦀\nHello, players.");
}

fn main() {
    print_welcome();

    // TODO: build game with user provided amount of rows.
    let mut game = build_game(4);

    let mut round: u32 = 0;
    while game.is_active() {
        round = round + 1;
        println!("Round: {}", round);
        print_game_state(&game);

        let mut ok_input = false;
        let mut row: usize = 0;
        let mut amount: u32 = 0;
        while !ok_input {
            row = get_user_move("Input the row: ".to_string()) as usize;
            amount = get_user_move("Input the amount: ".to_string());
            ok_input = game.admits(row, amount);
            if !ok_input {
                println!("Input needs to be within the game bounds.")
            }
        }

        game = take_from_row(&mut game, row, amount);
        game.player_1_move = !game.player_1_move;
    }
    print_game_finish(&game);
}

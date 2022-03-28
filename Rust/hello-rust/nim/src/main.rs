use std::io;

struct Game {
    active: bool,
    player_1_move: bool,
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

fn print_player_greeting(player_nr: u32) {
    println!("Your move, player {}!", player_nr);
}

fn print_game_state(game: Game) {
    if game.active {
        if game.player_1_move {
            print_player_greeting(1);
        } else {
            print_player_greeting(2);
        }
        for row in game.rows {
            print_row(row);
        }
    }
}

fn take_from_row(game: Game, row_index: u32, amount: u32) -> Game {
    // TODO: implement a way to take items from the specified game row
}

fn main() {
    println!("Hello, players.");

    // TODO: build game with user provided amount of rows.
    let game = build_game(4);

    print_game_state(game);
}

import { representRoom } from './labyrinth';

test('representRoom_emptyRoom', () => {
    const output = representRoom({ meta: { id: 'x' }, directions: {} });
    console.debug(output);
    expect(output).toEqual('+-----+\n|     |\n|     |\n|     |\n+-----+\n')
});

test('representRoom_roomWithNorthEntrance', () => {
    const output = representRoom({ meta: { id: 'x' }, directions: { north: { id: 'y' } } });
    console.debug(output);
    expect(output).toEqual('+--O--+\n|     |\n|     |\n|     |\n+-----+\n')
});

test('representRoom_roomWithNorth&WestEntrance', () => {
    const output = representRoom({
        meta: { id: 'x' }, directions: {
            north: { id: 'y' },
            west: { id: 'z' }
        }
    });
    console.debug(output);
    expect(output).toEqual('+--O--+\n|     |\n=     |\n|     |\n+-----+\n')
});

test('representRoom_roomWithNorth&West&EastEntrance', () => {
    const output = representRoom({
        meta: { id: 'x' }, directions: {
            north: { id: 'y' },
            west: { id: 'z' },
            east: { id: 'q' },
        }
    });
    console.debug(output);
    expect(output).toEqual('+-O-+\n|     |\n=     =\n|     |\n+-----+\n')
});

test('representRoom_roomWithNorth&West&East&SouthEntrance', () => {
    const output = representRoom({
        meta: { id: 'x' }, directions: {
            north: { id: 'y' },
            west: { id: 'z' },
            east: { id: 'q' },
            south: { id: 'p' }
        }
    });
    console.debug(output);
    expect(output).toEqual('+--O--+\n|     |\n=     =\n|     |\n+--O--+\n')
});

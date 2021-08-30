'use strict';

const got = require('got');

const settings = {
    DEBUG: process.env.RP_DEBUG
};

class Poem {
    constructor(title, author, lines) {
        this.title = title;
        this.author = author;
        this.lines = lines;
    }
}

const poetrySuppliers = [
    {
        id: 'PoetryDb',
        getRandomPoem: async () => {
            const requestUrl = 'https://poetrydb.org/random/1';
            const [data] = await got(requestUrl).json();
            settings.DEBUG && console.debug(data);
            return new Poem(data.title, data.author, data.lines);
        }
    }
]

const outputPoem = (poem) => {
    console.info(`${poem.author}:`);
    console.info(`"${poem.title}"`);
    console.info(poem.lines.join('\n'));
}

// main app entrypoint
const main = async () => {
    settings.DEBUG && console.info('DEBUG MODE IS ON');
    const randomSupplierIndex = Math.floor(Math.random() * poetrySuppliers.length);
    const randomSupplier = poetrySuppliers[randomSupplierIndex]
    const poem = await randomSupplier.getRandomPoem();
    outputPoem(poem);
};

// run
main().catch(console.error);
const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
    content: [
        "./public/*.html",
        "./app/helpers/**/*.rb",
        "./app/javascript/**/*.js",
        "./app/views/**/*.{erb,haml,html,slim}",
        "./app/components/**/*.{erb,haml,html,slim,rb}",
    ],
    theme: {
        extend: {
            colors: {
                primary: "#007BC5",
                secondary: "#31373D",
                "secondary-light": "#9FA5AC",
                "secondary-lighter": "#F6F7FA",
            },
            fontFamily: {
                sans: ["Inter var", ...defaultTheme.fontFamily.sans],
            },
            scale: {
                101: "1.01",
                102: "1.02",
                103: "1.03",
                107: "1.07",
            },
        },
    },
    plugins: [
        require("@tailwindcss/forms"),
        require("@tailwindcss/aspect-ratio"),
        require("@tailwindcss/typography"),
        require("@tailwindcss/container-queries"),
    ],
};

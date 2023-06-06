const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
    content: [
        "./public/*.html",
        "./app/helpers/**/*.rb",
        "./app/javascript/**/*.js",
        "./app/views/**/*.{erb,haml,html,slim}",
        "./app/components/**/*.{erb,haml,html,slim}",
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
        },
    },
    plugins: [
        require("@tailwindcss/forms"),
        require("@tailwindcss/aspect-ratio"),
        require("@tailwindcss/typography"),
        require("@tailwindcss/container-queries"),
    ],
};

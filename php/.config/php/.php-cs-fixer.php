<?php

$finder = PhpCsFixer\Finder::create()
    ->in(__DIR__)
    ->exclude('vendor')
    ->name('*.php');

return (new PhpCsFixer\Config())
    ->setRiskyAllowed(true)
    ->setIndent('    ') // 4 spaces
    ->setLineEnding("\n")
    ->setRules([
        '@PSR12' => true,
        '@Symfony' => true,

        // Formatting helpers
        'blank_line_after_opening_tag' => true,
        'single_line_after_imports' => true,
        'no_unused_imports' => true,
        'no_blank_lines_after_phpdoc' => true,
        'no_whitespace_in_blank_line' => true,

        // Require/Include formatting
        'include' => true,
        'ordered_imports' => true,

        'indentation_type' => true,

        // Whitespace control
        'whitespace_after_comma_in_array' => true,
        'no_extra_blank_lines' => ['tokens' => [
            'throw',
            'return',
            'extra',
            'continue',
            'break',
        ]],

        // Other cleanups
        'line_ending' => true,
        'single_quote' => true,
        'trailing_comma_in_multiline' => ['elements' => ['arrays']],
    ])
    ->setFinder($finder);

<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $title =fake()->unique->name();
        $slug = Str::slug($title);

        $subCategories = [4,11];
        $subCatRandKey = array_rand($subCategories);

        $brands = [10,11];
        $brandsRandKey = array_rand($brands);

        return [
            'title' => $title,
            'slug' => $slug,
            'category_id' => 28,
            'sub_category_id' => $subCategories[$subCatRandKey],
            'price' => rand(30,800),
            'sku' =>  rand(1000,10000),
            'track_qty' => 'Yes',
            'qty' => 10,
            'is_featured' => 'Yes',
            'status' => 1,
        ];
    }
}

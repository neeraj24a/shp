<?php

namespace backend\models;

use Yii;
use yii\behaviors\SluggableBehavior;

/**
 * This is the model class for table "products".
 *
 * @property string $id
 * @property string $sku
 * @property string $slug
 * @property string $name
 * @property string $description
 * @property string $category
 * @property int $units_in_stock
 * @property string $unit_price
 * @property string $offer_price
 * @property string $variation
 * @property string $size
 * @property string $colors
 * @property string $weight_type
 * @property string $weight
 * @property int $available
 * @property int $discount
 * @property string $main_image
 * @property int $status
 * @property int $deleted
 * @property string $created_by
 * @property string $modified_by
 * @property string $date_entered
 * @property string $date_modified
 */
class Products extends \yii\db\ActiveRecord {

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'products';
    }

    public function beforeSave($insert) {
        //pre($model, true);
        if ($this->isNewRecord) {
            $this->id = create_guid();
            $this->created_by = Yii::$app->user->id;
            $this->modified_by = Yii::$app->user->id;
            $this->deleted = 0;
            $this->status = 1;
            $this->date_entered = date("Y-m-d H:i:s");
            $this->date_modified = date("Y-m-d H:i:s");
        } else {
            $this->modified_by = Yii::$app->user->id;
            $this->date_modified = date("Y-m-d H:i:s");
        }
        return parent::beforeSave($insert);
    }

    public function behaviors() {
        return [
            [
                'class' => SluggableBehavior::className(),
                'attribute' => 'name',
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['sku', 'name', 'description', 'category', 'units_in_stock', 'unit_price', 'weight_type', 'main_image'], 'required'],
            [['description', 'variation', 'size', 'colors', 'weight_type'], 'string'],
            [['units_in_stock'], 'integer'],
            [['date_entered', 'date_modified'], 'safe'],
            [['id', 'category', 'created_by', 'modified_by'], 'string', 'max' => 36],
            [['sku'], 'string', 'max' => 64],
            [['slug', 'name'], 'string', 'max' => 256],
            [['unit_price', 'offer_price', 'weight'], 'string', 'max' => 16],
            [['available', 'discount', 'status', 'deleted'], 'string', 'max' => 1],
            [['main_image'], 'string', 'max' => 264],
            [['id', 'sku'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'sku' => 'Sku',
            'slug' => 'Slug',
            'name' => 'Name',
            'description' => 'Description',
            'category' => 'Category',
            'units_in_stock' => 'Units In Stock',
            'unit_price' => 'Unit Price',
            'offer_price' => 'Offer Price',
            'variation' => 'Variation',
            'size' => 'Size',
            'colors' => 'Colors',
            'weight_type' => 'Weight Type',
            'weight' => 'Weight',
            'available' => 'Available',
            'discount' => 'Discount',
            'main_image' => 'Main Image',
            'status' => 'Status',
            'deleted' => 'Deleted',
            'created_by' => 'Created By',
            'modified_by' => 'Modified By',
            'date_entered' => 'Date Entered',
            'date_modified' => 'Date Modified',
        ];
    }

}

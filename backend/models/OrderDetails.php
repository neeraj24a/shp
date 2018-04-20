<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "order_details".
 *
 * @property string $id
 * @property string $order
 * @property string $product
 * @property string $product_price
 * @property string $purchased_price
 * @property int $quantity
 * @property int $status
 * @property int $deleted
 * @property string $created_by
 * @property string $modified_by
 * @property string $date_entered
 * @property string $date_modified
 */
class OrderDetails extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'order_details';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'order', 'product', 'product_price', 'purchased_price', 'quantity', 'created_by', 'modified_by', 'date_entered', 'date_modified'], 'required'],
            [['quantity'], 'integer'],
            [['date_entered', 'date_modified'], 'safe'],
            [['id', 'order', 'product', 'created_by', 'modified_by'], 'string', 'max' => 36],
            [['product_price', 'purchased_price'], 'string', 'max' => 16],
            [['status', 'deleted'], 'string', 'max' => 1],
            [['id'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'order' => 'Order',
            'product' => 'Product',
            'product_price' => 'Product Price',
            'purchased_price' => 'Purchased Price',
            'quantity' => 'Quantity',
            'status' => 'Status',
            'deleted' => 'Deleted',
            'created_by' => 'Created By',
            'modified_by' => 'Modified By',
            'date_entered' => 'Date Entered',
            'date_modified' => 'Date Modified',
        ];
    }
}

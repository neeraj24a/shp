<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "orders".
 *
 * @property string $id
 * @property string $customer
 * @property string $order_number
 * @property string $order_amount
 * @property string $payment_method
 * @property string $transaction_id
 * @property string $payment_status
 * @property string $order_date
 * @property string $shipping_date
 * @property int $is_paid
 * @property string $freight
 * @property string $note
 * @property string $shipping_method
 * @property int $is_shipped
 * @property string $shipping_tracking
 * @property string $shipping_address
 * @property string $billing_address
 * @property int $status
 * @property int $deleted
 * @property string $created_by
 * @property string $updated_by
 * @property string $date_entered
 * @property string $date_modified
 */
class Orders extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'orders';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'customer', 'order_number', 'order_amount', 'payment_method', 'transaction_id', 'payment_status', 'order_date', 'freight', 'shipping_address', 'billing_address', 'created_by', 'updated_by', 'date_entered', 'date_modified'], 'required'],
            [['payment_method', 'payment_status'], 'string'],
            [['order_date', 'shipping_date', 'date_entered', 'date_modified'], 'safe'],
            [['id', 'customer', 'shipping_address', 'billing_address', 'created_by', 'updated_by'], 'string', 'max' => 36],
            [['order_number'], 'string', 'max' => 32],
            [['order_amount', 'freight'], 'string', 'max' => 16],
            [['transaction_id'], 'string', 'max' => 64],
            [['is_paid', 'is_shipped', 'status', 'deleted'], 'string', 'max' => 1],
            [['note', 'shipping_tracking'], 'string', 'max' => 512],
            [['shipping_method'], 'string', 'max' => 256],
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
            'customer' => 'Customer',
            'order_number' => 'Order Number',
            'order_amount' => 'Order Amount',
            'payment_method' => 'Payment Method',
            'transaction_id' => 'Transaction ID',
            'payment_status' => 'Payment Status',
            'order_date' => 'Order Date',
            'shipping_date' => 'Shipping Date',
            'is_paid' => 'Is Paid',
            'freight' => 'Freight',
            'note' => 'Note',
            'shipping_method' => 'Shipping Method',
            'is_shipped' => 'Is Shipped',
            'shipping_tracking' => 'Shipping Tracking',
            'shipping_address' => 'Shipping Address',
            'billing_address' => 'Billing Address',
            'status' => 'Status',
            'deleted' => 'Deleted',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'date_entered' => 'Date Entered',
            'date_modified' => 'Date Modified',
        ];
    }
}

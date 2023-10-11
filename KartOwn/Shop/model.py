from django.db import models


class Products(models.Model):
    product_id = models.fields.IntegerField
    name = models.fields.CharField(max_length=100)
    description = models.fields.TextField
    price = models.fields.FloatField
    category_id = models.fields.IntegerField

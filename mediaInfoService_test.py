from falcon import testing
import pytest

from mediaInfoService import create_wsgi_app


@pytest.fixture('session')
def client():
    return testing.TestClient(create_wsgi_app('./'))


def test_get_message(client):
    metadata = client.simulate_get('/mediaInfoService_test.png').json
    assert metadata['width'] == 16
    assert metadata['height'] == 16
    assert 'png' in metadata['mime_type']


@pytest.mark.skip(reason="todo")
def test_404_message(client):
    pass

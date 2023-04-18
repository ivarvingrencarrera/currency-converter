from src.app import app


def test_hello_world() -> None:
    status_code_ok = 200
    with app.test_client() as client:
        response = client.get('/')
        assert response.status_code == status_code_ok
        assert response.data == b'Hello, Docker!'
